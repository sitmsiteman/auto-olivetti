# auto-olivetti

Automatically enable `olivetti-mode` when the window is wide

# Description

[Olivetti](https://github.com/rnkn/olivetti) is a wonderful mode. So wonderful,
in fact, that I wish it came on automatically. This package does just that.

# Installing

Until I get this on MELPA or the like, you can just clone this repository, and put the following in your `init.el`:

```emacs-lisp
(load-file "path/to/auto-olivetti.el")
(auto-olivetti-mode)
```

If you use `use-package` with [Elpaca](https://github.com/progfolio/elpaca), you can install like so:

```emacs-lisp
(use-package auto-olivetti
  :elpaca (auto-olivetti :host sourcehut :repo "ashton314/auto-olivetti")
  :config
  (auto-olivetti-mode))
```

# Configuration

 - `auto-olivetti-enabled-modes`
 
   List of modes for which to enable `olivetti-mode` automatically. Defaults to `'(prog-mode text-mode)`

 - `auto-olivetti-threshold-fraction`
   
   Fraction of `olivetti-body-width` at which to enable `olivetti-mode`.

 - `auto-olivetti-threshold-absolute`

   Number of columns at which to enable `olivetti-mode`.

 - `auto-olivetti-threshold-method`
   Choose between the fractional and absolute methods.
 
# License

MIT

# Authors

 - Ashton Wiersdorf https://lambdaland.org
