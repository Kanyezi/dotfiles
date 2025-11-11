-- LuaSnip: C++ snippets
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- C++ template snippet with trigger "xi"
ls.add_snippets("cpp", {
  s("xi", {
    t({
      "#include<bits/stdc++.h>",
      "using namespace std;",
      "#define ll long long",
      "#define PII pair<int,int>",
      "#define Vi vector<int>",
      "ll n,m,num,k,a,b,c,d,sum=0;",
      "const ll NE=10000;",
      "string ss,s;",
      "char cc;",
      "",
      "void slove(){",
      "    ",
    }),
    i(1, ""),  -- cursor position $1 inside slove()
    t({
      "",
      "}",
      "",
      "int main(){",
      "    ios::sync_with_stdio(0);cin.tie(0);cout.tie(0);",
      "    // 不能使用printf,scanf",
      "    int t=1;",
      "    // cin >> t;",
      "    while (t--)",
      "    {",
      "        slove();",
      "    }",
      "    return 0;",
      "}",
    }),
  }),
})
