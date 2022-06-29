local ls = require "luasnip"
local types = require "luasnip.util.types"

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local s = ls.snippet
local ps = ls.parser.parse_snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.config.set_config {
  history = true,
  hidden = true,

  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,

  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      },
    },
  },
}

ls.add_snippets("all", {
  ps("hola", "Hola mundo!"),
  s("date", f(function()
    return os.date "%D"
    end)
  ),
  ps ("for", "for ($1 i=$2; i$3; i++) {\n\t$0\n}"),
})

ls.add_snippets("javascript", {
  ps("cs", "console.log($1)$0")
})

ls.add_snippets("lua", {
    ps("lf", "local $1 = function($2)\n $0\nend"),
    s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
})

ls.add_snippets("cpp", {
    ps("cpp", "#include<iostream>\nusing namespace std;\n\nint main() {\n\t$1\n\treturn 0;\n}$0"),
    ps("ios", "#include<iostream>\n$0"),
    ps("cout", 'cout<<$1<<endl;$0'),
    ps("scout", 'std::cout<<$1<<std::endl;$0'),
    ps("class", '\nclass $1 {\n\t$0\n};\n'),
    ps("main", "int main() {\n\t$1\n\treturn 0;\n}$0"),
})

ls.add_snippets("java", {
    ps("class", "public class $1 {\n\t$0\n}"),
    ps("main", "public static void main(String[] args) {\n\t$0\n}"),
    ps("set", "public void set$1($2) { this.$3=$4; }$0"),
    -- s(
    --   "set", "public void set$1($2) { this.$3=$0; }"
    -- ),
    ps("get", "public $1 get$2() { return $1; }$0"),
    ps("sout", "System.out.println($0);"),
})

ls.add_snippets("html", {
  ps("!", "<!DOCTYPE html>\n<html lang=\"en\">\n\t<head>\n\t$1\n\t</head>\n\t<body>\n\t$0\n\t</body>\n</html")
})

ls.add_snippets("tex", { -- LATEX
  -- General
  ps("doc",
[[
\documentclass{article}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[english]{babel}
\usepackage[document]{ragged2e}

\usepackage{amsfonts}
\usepackage{natbib}
\usepackage[dvipsnames]{xcolor}
\usepackage{graphicx}

\usepackage[fleqn]{amsmath}
\usepackage{amssymb}

\title{$1}
\author{Victor Gerardo Rodríguez Barragán}
\date{$2}

\begin{document}
\maketitle
$0

\end{document}]]
  ),
  s("bg", fmt("\\begin{{{}}}\n\\end{{{}}}", { i(1, ""), rep(1) })),
  s("bgs", fmt("\\begin{{{}}}\\end{{{}}}", { i(1, ""), rep(1) })),
  ps("im", '\\includegraphics[width=$1\\textwidth]{$2}$0'),
  ps("ims", '\\includegraphics[width=$1\\textwidth]{/home/gerry/Pictures/screenshots/sele/$2}$0'),
  ps("s", '\\section{$1}$0'),
  ps("ss", '\\section*{$1}$0'),
  ps("sb", '\\subsection{$1}$0'),
  ps("ssb", '\\subsection*{$1}$0'),
  ps("sbb", '\\subsubsection{$1}$0'),
  -- Text
  ps("tc", "\\textcolor{$1}{$2}$0"),
  ps("tu", "\\underline{$1}$0"),
  ps("tb", "\\textbf{$1}$0"),
  ps("en", "\\begin{enumerate}\n\\item $0\n\\end{enumerate}"),
  ps("it", "\\item $0"),
  ps("t", "\\text{$1}$0"),
  ps("vs", "\\vspace{$1}$0"),

  -- Math
  ps("mk", "\\$$1\\$$0"),
  ps("vc", "\\vec{$1}$0"),
  ps("fc", "\\frac{$1}{$2}$0"),
  ps("eq", "\\begin{equation}\n$0\n\\end{equation}"),
  ps("al", "\\begin{align*}\n\t$0\n\\end{align*}"),
  ps("nt", "\\notag"),
  ps("mx", "\\begin{bmatrix}\n\t$0\n\\end{bmatrix}"),
  ps("dc", "\\dotsc"),
  -- OneLine
  s("lbg", fmt("\\begin{{{}}}\\end{{{}}}", { i(1, ""), rep(1) })),
  ps("lmx", "\\begin{bmatrix}$1\\end{bmatrix}$0"),
})

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

ls.add_snippets("all", {
  s("ternary", {
    i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
  })
})
