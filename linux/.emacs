(add-to-list 'load-path "~/.emacs.d/plugins")

(menu-bar-mode nil) ;禁用菜单
;; 取消工具栏
(tool-bar-mode nil)
(setq make-backup-files nil) ; 禁止保存备份文件
;显示行号
(setq column-number-mode t)
(setq line-number-mode t)
(setq linum-format "%d ")
(setq-default indent-tabs-mode nil) ;空格代替TAB
(global-font-lock-mode t) ;开启语法高亮
;;设置打开文件的缺省路径，这里为桌面，默认的路径为“～/”
(setq default-directory "~/00-WORKSPACE")
;; 启用时间显示设置，在minibuffer上面的那个杠上
(display-time-mode t)
;; 使用24小时制
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)
(fset 'yes-or-no-p 'y-or-n-p)    ; 按 y 或空格键表示 yes，n 表示 no
(setq show-paren-mode t) ;打开括号匹配显示模式
(setq show-paren-style 'parenthesis) ;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处。


;(load-file "~/.emacs.d/plugins/cedet-1.1/common/cedet.el")
(require 'cedet)
;(semantic-load-enable-excessive-code-helpers)
(global-ede-mode t)
;(require 'semantic-ia)
;;(require 'semantic-gcc) 
;;(global-srecode-minor-mode 1)


;; ECB 配置
(add-to-list 'load-path "~/.emacs.d/plugins/ecb/")
(require 'ecb)
;(ecb-activate)
(setq ecb-auto-activate t
          ecb-tip-of-the-day nil
          ecb-tree-indent 4
          ecb-windows-height 0.5
          ecb-windows-width 0.20)
          ecb-auto-compatibility-check nil
          ecb-version-check nil
          inhibit-startup-message t
(require 'ecb-autoloads)
(setq stack-trace-on-error nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(global-set-key (kbd "<f7>") 'ecb-minor-mode) ; 打开ecb
(global-set-key (kbd "C-<left>") 'windmove-left)   ;左边窗口
(global-set-key (kbd "C-<right>") 'windmove-right)  ;右边窗口
(global-set-key (kbd "C-<up>") 'windmove-up)     ; 上边窗口
(global-set-key (kbd "C-<down>") 'windmove-down)   ; 下边窗口


;; CSCOPE
(require 'xcscope)
;; C-c s a             设定初始化的目录，一般是你代码的根目录
;; C-s s I             对目录中的相关文件建立列表并进行索引
;; C-c s s             序找符号
;; C-c s g             寻找全局的定义
;; C-c s c             看看指定函数被哪些函数所调用
;; C-c s C             看看指定函数调用了哪些函数
;; C-c s e             寻找正则表达式
;; C-c s f             寻找文件
;; C-c s i             看看指定的文件被哪些文件include)


;; 主题配置
;;(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0/")
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-arjen)

(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize) 
(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")


(require 'switch-window)


;; auto-complete 配置
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete-1.3.1/ac-dict")
(ac-config-default)
(global-auto-complete-mode 1)
(setq ac-use-menu-map t)
(setq ac-auto-start 2)
(setq ac-auto-show-menu 0.8)
(setq ac-dwim t)

;; auto-complete-clang 配置
;;echo "" | g++ -v -x c++ -E -
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-clang")
(require 'auto-complete-clang)  
(setq ac-clang-auto-save t)  
(setq ac-auto-start t)  
(setq ac-quick-help-delay 0.5)  
;; (ac-set-trigger-key "TAB")  
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)  
(define-key ac-mode-map  [(control tab)] 'auto-complete)  
(defun my-ac-config ()  
  (setq ac-clang-flags  
        (mapcar(lambda (item)(concat "-I" item))  
               (split-string  
                "  
 /usr/include/libxml2
 /usr/include/c++/5
 /usr/include/x86_64-linux-gnu/c++/5
 /usr/include/c++/5/backward
 /usr/lib/gcc/x86_64-linux-gnu/5/include
 /usr/local/include
 /usr/lib/gcc/x86_64-linux-gnu/5/include-fixed
 /usr/include/x86_64-linux-gnu
 /usr/include
")))  
  (setq-default ac-sources
