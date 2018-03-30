
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(package-selected-packages
   (quote
    (google-c-style iedit inf-clojure yasnippet auto-complete-rst auto-complete-pcmp auto-complete-nxml auto-complete-exuberant-ctags auto-complete-distel auto-complete-clang-async auto-complete-clang auto-complete-chunk auto-complete-c-headers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;ELIMINAMOS BARRA DE MENU,BARRA TOOLS Y SCROLL DE VENTANAS
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;CONFIGURACION C++  
;start packcage.el with emacs
(require 'package)
;add MELPA TO REPOSITORY LIST
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;initialize package.el
(package-initialize)
;auto compleate
(require 'auto-complete)
;do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
					;start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
					;let's define a function with itializes auto-complete-c-headers
(defun my:ac-c-header.init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
					;now lets call this function from c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header.init)
(add-hook 'c-mode-hook 'my:ac-c-header.init)

					;fix iedit
(define-key global-map (kbd "C-c ;") 'iedit-mode)
					;google c-style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
