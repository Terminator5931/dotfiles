local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require 'luasnip.util.events'
local ai = require 'luasnip.nodes.absolute_indexer'
local extras = require 'luasnip.extras'
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local conds = require 'luasnip.extras.expand_conditions'
local postfix = require('luasnip.extras.postfix').postfix
local types = require 'luasnip.util.types'
local parse = require('luasnip.util.parser').parse_snippet
local ms = ls.multi_snippet
local k = require('luasnip.nodes.key_indexer').new_key

ls.add_snippets('cpp', {
  s(
    'cpp',
    fmt(
      [[
using namespace std;
typedef vector<int> vi;
typedef pair<int, int> pi;
#define ln '\n'
#define F first
#define S second
#define MP make_pair
#define PB push_back
#define REP(i, a, b) for (int i = a; i <= b; i++)
#define RREP(i, a, b) for (int i = a; i >= b; i--)
//{{{{{{
#ifdef LOCAL
#include "includes/debug_utils.h"
#include "includes/clang_dsa.h"
#else
#include <bits/stdc++.h>
#define Fast_IO                                                                \
  ios_base::sync_with_stdio(false);                                            \
  cin.tie(NULL);                                                               \
  cout.tie(NULL);
#define debug(...) ;
#define dbgv_range(...) ;
#endif
//}}}}}}
int main() {{
  //{{{{{{
#ifndef LOCAL
  Fast_IO;
#endif
  //}}}}}}

  {}
}}
    ]],
      { i(0) }
    )
  ),

  s(
    'for',
    fmt(
      [[
for ({} {} = 0; {} < {}; {}) {{
  {}
}}
]],
      {
        c(1, { t 'int', t 'float', t 'double' }),
        c(2, { t 'i', t 'j', t 'k' }),
        rep(2),
        i(3, 'count'),
        d(4, function(args)
          local var_name = args[1][1]
          return sn(nil, { i(1, var_name .. '++') })
        end, { 2 }),
        i(0),
      }
    ),
    { priority = 1001 }
  ),
  s(
    'letcode',
    fmt(
      [[

//{{{{{{
#ifdef LOCAL
#include "includes/clang_dsa.h"
#include "includes/debug_utils.h"
#else
#include <bits/stdc++.h>
#define Fast_IO                                                                \
  ios_base::sync_with_stdio(false);                                            \
  cin.tie(NULL);                                                               \
  cout.tie(NULL);
#define debug(...) ;
#define dbgv_range(...) ;
#endif
using namespace std;
auto init = []()
{{
  ios::sync_with_stdio(false);
  cin.tie(0);
  cout.tie(0);
  return 0;
}}();
typedef vector<int> vi;
typedef pair<int, int> pi;
#define ln '\n'
#define F first
#define S second
#define MP make_pair
#define PB push_back
#define REP(i, a, b) for (int i = a; i <= b; i++)
#define RREP(i, a, b) for (int i = a; i >= b; i--)
//}}}}}}
class Solution {{
public:
  {}
}};
//{{{{{{
const size_t BUFFER_SIZE = 0x6fafffff; 
alignas(std::max_align_t) char buffer[BUFFER_SIZE];
size_t buffer_pos = 0;
void* operator new(size_t size) {{
    constexpr std::size_t alignment = alignof(std::max_align_t);
    size_t padding = (alignment - (buffer_pos % alignment)) % alignment;
    size_t total_size = size + padding;
    char* aligned_ptr = &buffer[buffer_pos + padding];
    buffer_pos += total_size;
    return aligned_ptr;
}}
void operator delete(void* ptr, unsigned long) {{}}
void operator delete(void* ptr) {{}}
void operator delete[](void* ptr) {{}} //}}}}}}
]],
      { i(0) }
    )
  ),
  s(
    'db',
    fmt(
      [[
debug({});
{}
]],
      {
        i(1),
        i(0),
      }
    )
  ),
})

ls.add_snippets('javascript', {
  s(
    'input',
    fmt(
      [[
const rq = require('readline-sync');
{}
]],
      {
        i(0),
      }
    )
  ),
  s(
    'ques',
    fmt(
      [[
rq.question('{}');
{}
]],
      {
        i(1),
        i(0),
      }
    )
  ),
})
