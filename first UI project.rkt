#lang racket
(require racket/gui/base)
(require racket/format)

(define F1 (new frame% [label "menu"]
                [x 100]
                [y 100]
                [min-width 200]	 
                [min-height 75]
                [stretchable-width #F]	 
                [stretchable-height #F]))

(define P1 (new vertical-panel%
                ;[alignment '(left)]
                [parent F1]))

(define TF (new text-field% [label "first input"]
                [parent P1]
                [init-value "type your name"]))

(define P2 (new vertical-panel%
                [style '(deleted)]
                [parent F1]))

(define MS (new message% [label "F you"]
                	[auto-resize #T]
                        [parent P2]))

(define BT (new button% [label "change to P2"]
                [parent P1]
                [callback (lambda (BT EV) (send F1 delete-child P1)
                            (send F1 add-child P2)
                            (send MS set-label (~a "F you " (send TF get-value))))]))

(define BT2 (new button% [label "change to P1"]
                 [parent P2]
                 [callback (lambda (BT EV) (send F1 delete-child P2)
                             (send F1 add-child P1))]))

(send F1 show #T)
                
