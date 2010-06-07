;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")

(cairo-win32-surface-create 0)

(setf *surface* (cairo-win32-surface-create (winapi::GetDC (get-window-handle))))
#S(cairo::surface ptr 44323072 destroyed nil)

(cairo-win32-surface-create-with-dib :argb32 -1 0)
#S(cairo::surface ptr 44322336 destroyed nil)

(setf *surface*
      (cairo-win32-surface-create-with-ddb (winapi::GetDC (get-window-handle)) :rgb24 1000 1000))
(cairo-win32-surface-create-with-ddb (winapi::GetDC (get-window-handle)) :argb32 1000 1000)


(cairo-win32-surface-get-dc *surface*)
2030114228
(cairo-win32-surface-get-image *surface*)
nil


(setf *surface* (cairo-win32-surface-create (winapi::GetDC (get-window-handle))))
(setf *surface* (cairo-surface-create-similar *surface*
                                              :color-alpha
                                              100
                                              100))
(cairo-surface-write-to-png *surface* (desktop "win32.png"))
nil
