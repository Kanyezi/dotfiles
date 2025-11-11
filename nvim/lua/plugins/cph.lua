return {
	{
		-- dir = vim.fn.expand("~/Document/cph/competitest.nvim"),
        'xeluxee/competitest.nvim',
		dependencies = "MunifTanjim/nui.nvim",
		config = function()
			-- 辅助函数：去除首尾空格
			local function trim(s)
				return s:match("^%s*(.-)%s*$")
			end

			-- 辅助函数：替换空格为下划线，并处理题目名称
			local function format_name(name)
				-- 先替换点号和空格为下划线
				name = name:gsub("[%s%.]", "_")
				-- 直接删除特殊字符（括号、中划线、感叹号等）
				name = name:gsub("[%(%)%-%!%?%#%@%&%*]", "")
				-- 清理多个连续下划线，只保留一个
				name = name:gsub("_+", "_")
				-- 去除首尾下划线
				name = name:match("^_*(.-)_*$") or name
				return name
			end

			-- 辅助函数：处理题目名称，移除字母.后的空格
			local function process_problem_name(name)
				-- 匹配字母后跟点的模式，并移除点后的空格
				name = name:gsub("^([A-Z])%s*%.%s*", "%1.")
				-- 替换空格为下划线
				name = format_name(name)
				return name
			end

			-- 自定义函数：提取 judge 和 contest
			local function parse_group(group)
				-- 按 " - " 分割
				local parts = {}
				for part in group:gmatch("([^-]+)") do
					table.insert(parts, trim(part))
				end
				
				local judge = parts[1] or "unknown"
				local contest = parts[2] or ""
				
				-- 对 judge 和 contest 进行格式化
				judge = format_name(judge)
				contest = format_name(contest)
				
				return judge, contest
			end

			-- 自定义函数：将空格替换为下划线
			local function replace_spaces(task, file_extension)
				local judge, contest = parse_group(task.group)
				local problem = process_problem_name(task.name)
				return string.format("%s/%s/%s/%s.%s", vim.fn.getcwd(), judge, contest, problem, file_extension)
			end

			-- 自定义函数：竞赛目录
			local function contest_directory(task, file_extension)
				local judge, contest = parse_group(task.group)
				return string.format("%s/%s/%s", vim.fn.getcwd(), judge, contest)
			end

			-- 自定义函数：竞赛中的问题路径（不要 Problem 文件夹，直接放在竞赛目录下）
			local function contest_problem_path(task, file_extension)
				local problem = process_problem_name(task.name)
				return string.format("%s.%s", problem, file_extension)
			end

			require("competitest").setup({
				save_current_file = true,
				save_all_files = false,
				compile_directory = ".",
				compile_command = {
					c = { exec = "sh", args = { "-c", "mkdir -p ./run && gcc -Wall \"$(FNAME)\" -o \"./run/$(FNOEXT)\"" } },
					cpp = { exec = "sh", args = { "-c", "mkdir -p ./run && g++ -Wall \"$(FNAME)\" -o \"./run/$(FNOEXT)\"" } },
					rust = { exec = "sh", args = { "-c", "mkdir -p ./run && rustc \"$(FNAME)\" -o \"./run/$(FNOEXT)\"" } },
					java = { exec = "sh", args = { "-c", "mkdir -p ./run && javac -d ./run \"$(FNAME)\"" } },
				},
				running_directory = "./run",
				run_command = {
					c = { exec = "./$(FNOEXT)" },
					cpp = { exec = "./$(FNOEXT)" },
					rust = { exec = "./$(FNOEXT)" },
					python = { exec = "python", args = { "$(FNAME)" } },
					java = { exec = "java", args = { "-cp", ".", "$(FNOEXT)" } },
				},
				multiple_testing = -1,
				maximum_time = 5000,
				output_compare_method = "squish",
				view_output_diff = false,
				testcases_directory = "./test",
				testcases_use_single_file = false,
				testcases_auto_detect_storage = true,
				testcases_single_file_format = "$(FNOEXT).testcases",
				testcases_input_file_format = "$(FNOEXT)_input$(TCNUM).txt",
				testcases_output_file_format = "$(FNOEXT)_output$(TCNUM).txt",
				companion_port = 1327,
				receive_print_message = true,
				start_receiving_persistently_on_setup = false,
				template_file = false,
				evaluate_template_modifiers = false,
				date_format = "%c",
				received_files_extension = "cpp",
				-- 单个问题保存路径（使用自定义函数）
				received_problems_path = replace_spaces,
				received_problems_prompt_path = false,
				-- 竞赛根目录（使用自定义函数）
				received_contests_directory = contest_directory,
				-- 每个问题在竞赛中的路径（使用自定义函数）
				received_contests_problems_path = contest_problem_path,
				received_contests_prompt_directory = false,
				received_contests_prompt_extension = false,
				open_received_problems = true,
				open_received_contests = true,
				replace_received_testcases = false,
			})
		end,
	},
}
