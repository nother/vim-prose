# VimProse

VimProse is a tiny plugin that configures a buffer to make working
with prose easier. It visually wraps long lines, enables navigating
within a wrapped line using the standard movement keys, sets undo
points after each sentence, turns on spell check, and does a couple
other things. The (short) source code is commented, so take a look.

## Installation

Use [Vundle](https://github.com/gmarik/vundle/) or
[Pathogen](https://github.com/tpope/vim-pathogen).
Otherwise, copy vimprose.vim into your plugins dir.

## Usage

To enable VimProse, do one of the following:

- `:VimProseEnable`
- chose VimProse from the Plugin menu
- `<Leader>p`, the default mapping

## Inspiration

- [Vim for prose, what are your tips?](http://www.reddit.com/r/vim/comments/ni0c2/vim_for_prose_what_are_your_tips/)
- [Soft word wrap in VIM 7 (for prose mainly)](http://contsys.tumblr.com/post/491802835/vim-soft-word-wrap)

## Related

- [VimRoom](http://projects.mikewest.org/vimroom/)
- [writer.vim](https://github.com/honza/writer.vim)
