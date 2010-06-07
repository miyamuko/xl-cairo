;; http://download.boulder.ibm.com/ibmdl/pub/software/dw/linux/l-cairo/cairo-example.tar
;; �̈ڐA

(load "_runner.l")

(defparameter *width*  800)
(defparameter *height* 250)
(defparameter *stride* (* *width* 4))
(defparameter *max-coords* 1024)

;; /* This path desribes what will be drawn later
;;    The bulk of it is doing the IBM letters by connect the dots
;;    at the very end, we will get fancy and add a (R) Registered logo.
;; */
(do-snippets (:width *width* :height *height* :normalize nil)
  (let ((pen-radius 10))
    (cairo-set-line-width cr (* pen-radius 2))

    ;; /* Use IBM Blue Pen Color with no ALPHA */
    (cairo-set-source-rgba cr .3 .42 .69 1)


    ;; /* This Draws the IBM 8 Lines "I" Logo */
    (cairo-move-to cr 10 10)
    (cairo-line-to cr 160 10)

    (cairo-move-to cr 10 40)
    (cairo-line-to cr 160 40)

    ;; /* NOTE: Narrower Middle: 1/3 width */
    (cairo-move-to cr 60 70)
    (cairo-line-to cr 110 70)

    (cairo-move-to cr 60 100)
    (cairo-line-to cr 110 100)

    (cairo-move-to cr 60 130)
    (cairo-line-to cr 110 130)

    (cairo-move-to cr 60 160)
    (cairo-line-to cr 110 160)
    ;; /* END Narrower Middle */

    (cairo-move-to cr 10 190)
    (cairo-line-to cr 160 190)

    (cairo-move-to cr 10 220)
    (cairo-line-to cr 160 220)
    ;; /* END "I" DRAWING */

    ;; /* This Draws the IBM 8 Lines "B" Logo */
    (cairo-move-to cr 170 10)
    (cairo-line-to cr 340 10)

    (cairo-move-to cr 170 40)
    (cairo-line-to cr 360 40)

    (cairo-move-to cr 200 70)
    (cairo-line-to cr 250 70)
    ;; /*B's have holes in them! */
    (cairo-move-to cr 300 70)
    (cairo-line-to cr 360 70)


    (cairo-move-to cr 210 100)
    (cairo-line-to cr 350 100)


    (cairo-move-to cr 210 130)
    (cairo-line-to cr 350 130)


    (cairo-move-to cr 200 160)
    (cairo-line-to cr 250 160)
    ;; /*B's have holes in them! */
    (cairo-move-to cr 300 160)
    (cairo-line-to cr 360 160)


    (cairo-move-to cr 170 190)
    (cairo-line-to cr 360 190)


    (cairo-move-to cr 170 220)
    (cairo-line-to cr 340 220)
    ;; /* END "B" DRAWING */




    ;; /* THE EVER POINTY "M"  */
    (cairo-move-to cr 370 10)
    (cairo-line-to cr 470 10)
    (cairo-move-to cr 560 10)
    (cairo-line-to cr 660 10)


    (cairo-move-to cr 370 40)
    (cairo-line-to cr 490 40)
    (cairo-move-to cr 540 40)
    (cairo-line-to cr 660 40)


    (cairo-move-to cr 400 70)
    (cairo-line-to cr 510 70)
    (cairo-move-to cr 520 70)
    (cairo-line-to cr 630 70)


    (cairo-move-to cr 400 100)
    (cairo-line-to cr 630 100)


    (cairo-move-to cr 400 130)
    (cairo-line-to cr 470 130)
    (cairo-move-to cr 480 130)
    (cairo-line-to cr 550 130)
    (cairo-move-to cr 560 130)
    (cairo-line-to cr 630 130)


    (cairo-move-to cr 400 160)
    (cairo-line-to cr 470 160)
    (cairo-move-to cr 490 160)
    (cairo-line-to cr 540 160)
    (cairo-move-to cr 560 160)
    (cairo-line-to cr 630 160)


    (cairo-move-to cr 370 190)
    (cairo-line-to cr 470 190)
    (cairo-move-to cr 500 190)
    (cairo-line-to cr 530 190)
    (cairo-move-to cr 560 190)
    (cairo-line-to cr 660 190)


    (cairo-move-to cr 370 220)
    (cairo-line-to cr 470 220)
    (cairo-move-to cr 510 220)
    (cairo-line-to cr 520 220)
    (cairo-move-to cr 560 220)
    (cairo-line-to cr 660 220)

    ;; /* END POINTY LETTERS */

    ;; /* We stroke the path so we see everything we just specified
    ;;    by connecting the dots
    ;; */
    (cairo-stroke cr)




    ;; /* Let us add a disclaimer and show some fancy cairo: */
    ;; /* We are going to want a nice fine lined circle around the R
    ;; you need to make sure you have stroked existing things
    ;; that you wanted drawn with the larger pen before continuing.
    ;; */
    (cairo-set-line-width cr (* pen-radius .5))

    ;; /* Now we will draw the fancy circle around the "R" */
    ;; /* NOTE: The angles are in radians */
    (cairo-move-to cr 710 200)
    (let ((angle1 (* 0 (/ pi 180.0)))
          (angle2 (* 360 (/ pi 180.0))))

      ;; /* We draw a large black circle */
      (cairo-set-source-rgba cr 0 0 0 1)
      (cairo-arc cr 710 200 20 angle1 angle2)
      (cairo-stroke cr)

      ;; /* We draw a smaller white circle centered on it */
      (cairo-set-source-rgba cr 1 1 1 1)
      (cairo-arc cr 710 200 20 angle1 angle2)
      ;; /* We use the fill operator to fill in the circle! */
      (cairo-fill cr)

      ;; /* We are going to draw the letter "R" with black pen*/

      (cairo-move-to cr 695 212) ;; /* Bottom left of text at point */
      (cairo-set-source-rgba cr 0 0 0 1)
      (cairo-select-font-face cr "Sans" :normal :bold)
      (cairo-set-font-size cr 40)
      (cairo-show-text cr "R")

      ;; /* We stroke everything we have just done
      ;;    to actually draw it...
      ;; */
      (cairo-stroke cr)
      )))
