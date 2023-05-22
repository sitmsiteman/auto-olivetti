# auto-olivetti

Automatically enable `olivetti-mode` when the window is wide

Source: https://sr.ht/~ashton314/auto-olivetti/

# Description

[Olivetti](https://github.com/rnkn/olivetti) is a wonderful mode. So wonderful, in fact, that I wish it came on automatically. This package does just that.

This package looks at `auto-olivetti-enabled-modes` to determine whether or not `olivetti-mode` should be enabled. By default this is the list `(text-mode prog-mode)`, but you can easily customize that list to suit your needs.

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

In addition to configuring `auto-olivetti` with the above listed variables, you will probably also want to set `olivetti-body-width`:

```emacs-lisp
(use-package auto-olivetti
  :config
  (setq-default olivetti-body-width 120)  ; set width for olivetti-mode
  (auto-olivetti-mode))
```
 
# License

MIT

# Authors

 - Ashton Wiersdorf https://lambdaland.org
