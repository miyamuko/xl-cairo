=begin

=== 2009-07-02 / 1.8.0

xl-cairo 1.8.0 �����[�X!

: �V�K�@�\

    * �Y�t���Ă��� cairo �� ((<"1.8.8"|URL:http://cairographics.org/news/cairo-1.8.8/>)) �ɍX�V�B
    * cairo 1.8 �Œǉ����ꂽ�֐����`
      * cairo-scaled-font-get-scale-matrix
      * cairo-scaled-font-text-to-glyphs
      * cairo-show-text-glyphs
      * cairo-surface-get-fallback-resolution
      * cairo-surface-has-show-text-glyphs
      * cairo-toy-font-face-create
      * cairo-toy-font-face-get-family
      * cairo-toy-font-face-get-slant
      * cairo-toy-font-face-get-weight
      * �����[�U�t�H���g�̓T�|�[�g���Ă��܂���
    * cairo 1.8 �Œǉ����ꂽ error-status �ɑΉ������O�N���X���`

: ��݊����܂ޕύX�_

    * �Ȃ�

: �o�O�C��

    * ���O�� xycairo ���� xl-cairo �ɂ����B

    * cairo 1.6 �Œǉ����ꂽ error-status �ɑΉ������O�N���X��Y��Ă����̂��C��

: ���̑�

    * �Ȃ�


=== 2008-04-14 / 1.6.0

xycairo 1.6.0 �����[�X!

: �V�K�@�\

    * �Y�t���Ă��� cairo �� ((<"1.6.4"|URL:http://cairographics.org/news/cairo-1.6.4/>)) �ɍX�V�B
    * cairo 1.6 �Œǉ����ꂽ�֐����`
      * cairo-win32-font-face-create-for-logfontw-hfont
      * cairo-has-current-point
      * cairo-path-extents
      * cairo-path-extents-list
      * cairo-path-extents-alist
      * cairo-format-stride-for-width
      * cairo-win32-printing-surface-create
      * cairo-ps-surface-restrict-to-level
      * cairo-ps-get-levels
      * cairo-ps-level-to-string
      * cairo-ps-surface-set-eps
      * cairo-ps-surface-get-eps
      * cairo-surface-copy-page
      * cairo-surface-show-page

=== 2008-01-21 / 0.0.8

xycairo 0.0.8 �����[�X!

: �V�K�@�\

    * �Y�t���Ă��� cairo �� ((<"1.4.14"|URL:http://cairographics.org/news/cairo-1.4.14/>)) �ɍX�V�B


=== 2007-12-01 / 0.0.7

xycairo 0.0.7 �����[�X!

: �V�K�@�\

    * �Y�t���Ă��� cairo �� ((<"1.4.12"|URL:http://cairographics.org/news/cairo-1.4.12/>)) �ɍX�V�B


=== 2007-09-30 / 0.0.6

xycairo 0.0.6 �����[�X!

: �V�K�@�\

    * �Y�t���Ă��� cairo �� ((<"1.4.10"|URL:http://cairographics.org/news/cairo-1.4.10/>)) �ɍX�V�B

    * cairo.ext �p�b�P�[�W�Ɉȉ��� API ��ǉ�
      * (cairo-circle): �^�~��`�� API
      * (cairo-polyline): �����`��`�� API
      * (cairo-polygon): ���p�`��`�� API
      * (cairo-regular-polygon): �����p�`��`�� API
      * (cairo-triangle): �O�p�`��`�� API
      * (cairo-heart): �n�[�g��`���֐�
      * (cairo-star): ����`���֐�
      * (cairo-rounded-rectangle): �p�ۂ̎l�p��`�� API (rcairo �݊�)
      * (cairo-rounded-rectangle-complex): �p�ۂ̎l�p��`�� API ���̂Q
      * (cairo-map-path-onto): ���݂̃p�X���w�肵���p�X��ɔz�u����
      * (radian->degree, degree->radian): �ʓx�@�Ɗp�x�̕ϊ��֐�

: ��݊����܂ޕύX�_

    * �Ȃ�

: �o�O�C��

    * cairo-show-text �� nil ���w�肷��ƃL�[�{�[�h���當�����ǂݍ������Ƃ��Ă��܂�
      �����C���Bnil �͋󕶎���Ɠ��������ɂ����B

    * (cairo-get-dash): �������j�󂪋N���Ă��������C���B

: ���̑�

    * �ȉ��̃T���v����ǉ��B
      * (examples/ext-circle.l): �^�~��`���T���v�� (cairo.ext:cairo-circle)
      * (examples/ext-triangle.l): �O�p�`��`���T���v�� (cairo.ext:cairo-trianble)
      * (examples/ext-polygon.l): �����p�`��`���T���v�� (cairo.ext:cairo-regular-polygon)
      * (examples/ext-heart.l): �n�[�g��`���T���v�� (cairo.ext:cairo-heart)
      * (examples/ext-star.l): ����`���T���v�� (cairo.ext:cairo-star)
      * (examples/ext-rounded-rectangle.l): �p�ۂ̎l�p��`���T���v�� (cairo.ext:cairo-rounded-rectangle)
      * (examples/ext-rounded-rectangle-complex.l): �p�ۂ̎l�p��`���T���v�� (cairo.ext:cairo-rounded-rectangle-complex)
      * (examples/text-on-path.l): �p�X��Ƀe�L�X�g��z�u����T���v�� (cairo.ext:cairo-map-path-onto, rcairo �� sample �̈ڐA)
    * (examples/hearts.l): cairo.ext:cairo-heart ���g���čĎ����B
    * (do-snippets): ���s���Ԃ��摜�̍����ɕ\������悤�ɂ����B


=== 2007-06-10 / 0.0.5

xycairo 0.0.5 �����[�X!

: �V�K�@�\

    * �Y�t���Ă��� cairo �� ((<"1.4.8"|URL:http://cairographics.org/news/cairo-1.4.8/>)) �ɍX�V�B

    * PDF surfaces �� PostScript surface ���T�|�[�g�B
      PDF/PostScript ���쐬�ł��܂��B

        (with-cairo-surface (surface (cairo-pdf-surface-create "output.pdf" 200 200))
          (with-cairo (cr (cairo-create surface))
            ...))

        (with-cairo-surface (surface (cairo-ps-surface-create "output.ps" 200 200))
          (with-cairo (cr (cairo-create surface))
            ...))

    * stream API ���T�|�[�g�B

      cairo-image-surface-create-from-png �� cairo-surface-write-to-png ��
      �X�g���[���������Ɏ�邱�Ƃ��ł���悤�ɂȂ�܂����B

      �]���ǂ���t�@�C�����������Ɏw�肷�邱�Ƃ��\�ł�

        (with-open-file (in "input.png" :direction :input)
          (with-open-file (out "output.png"
                               :direction :output
                               :if-exists :supersede
                               :if-does-not-exist :create)
            (with-cairo-surface (image (cairo-image-surface-create-from-png in))
              (with-cairo-surface (surface (cairo-image-surface-create :argb32 100 100))
                (with-cairo (cr (cairo-create surface))
                  (with-output-to-png (surface out)
                    ...))))))

    * with-output-to-png �}�N����ǉ��B

        (with-cairo-surface (surface (cairo-image-surface-create :argb32 100 100))
          (with-cairo (cr (cairo-create surface))
            (with-output-to-png (surface "output.png")
              ...)))

: ��݊����܂ޕύX�_

    * cairo-*-destroy �͂���ς� export ����悤�ɂ����B

: �o�O�C��

    * �Ȃ�

: ���̑�

    * �A�v���ƃ��C�u�����̈ˑ��x�������邽�߂ɁAwith-xxx �}�N���̖{�̂�
      call-with-xxx �֐����Ŏ�������悤�ɂ��܂����B

      ((<"Why I Like CALL-WITH-* Style In Macros"|URL:http://random-state.net/log/3390120648.html>))
      ���Q�l�ɂ��܂����B

    * �ȉ��̃T���v����ǉ��B

      * (examples/text-postscript.l): text.l �� PostScript ��
      * (examples/text-japanese-pdf.l): text-japanese.l �� PDF ��
      * (examples/imagepattern-png-stream.l): PNG �� stream API �̃T���v��
      * (examples/lissajous-curves.l): ���T�[�W���Ȑ���`���T���v�� (stolen from cl-cairo2)
      * (examples/hearts.l): �n�[�g�������_���ɕ`���T���v�� (stolen from cl-cairo2)


=== 2007-06-04 / 0.0.4

xycairo 0.0.4 �����[�X!

: �V�K�@�\

    * with- �n�}�N����ǉ� (cairo package)

      * with-cairo
      * with-cairo-path
      * with-cairo-pattern
      * with-cairo-font-face
      * with-cairo-font-options
      * with-cairo-scaled-font
      * with-cairo-surface

      * with-cairo-save
      * with-cairo-fill
      * with-cairo-fill-preserve
      * with-cairo-stroke
      * with-cairo-stroke-preserve
      * with-cairo-group

    * cairo-push-group �� optional �� content ���������悤�ɂ��܂����B
      (cairo-push-group-with-content �Ƃ̓���)

    * cairo-pop-group �� optional �� to-source ���������悤�ɂ��܂����B
      (cairo-pop-group-to-source �Ƃ̓���)

    * xxx-extents �� list �ŕԂ��֐���ǉ��B

      * cairo-clip-extents-list
      * cairo-fill-extents-list
      * cairo-stroke-extents-list
      * cairo-font-extents-list
      * cairo-text-extents-list
      * cairo-glyph-extents-list
      * cairo-scaled-font-extents-list
      * cairo-scaled-font-text-extents-list
      * cairo-scaled-font-glyph-extents-list

    * cairo �p�b�P�[�W�� nicknames �� cairo.api ��ݒ�

: ��݊����܂ޕύX�_

    * �ȉ��̊֐��� export ���Ȃ��悤�ɂ��܂����B

      * cairo-push-group-with-content
      * cairo-pop-group-to-source
      * cairo-pattern-get-color-stop-count
      * cairo-pattern-get-color-stop-rgba

      * cairo-*-destroy
      * cairo-*-reference
      * cairo-*-get-reference
      * cairo-*-status

: �o�O�C��

      * cairo-clip-rectangle-list �������Ȃ��Ȃ��Ă����̂��C���B

: ���̑�

    * �ȉ��̃T���v����ǉ��B

      * (examples/drive-info.l): drive-info ���g���ċ󂫗e�ʂ��O���t�\������T���v���B


=== 2007-05-27 / 0.0.3

xycairo 0.0.3 �����[�X!

: �V�K�@�\

    * cairo.ext �p�b�P�[�W��ǉ��B

      ������ cairo API �̃o�C���f�B���O�ł͂Ȃ��Ǝ��g����
      cairo.ext �p�b�P�[�W���ɒ�`���܂��B

    * �Œ���� with- �n�}�N����ǉ� (cairo.ext)

      * with-cairo
      * with-cairo-surface

      ��:

        (require "cairo")
        (use-package :cairo)
        (use-package :cairo.ext)  ;; ���ꂪ�K�v

        (with-cairo-surface (surface (cairo-image-surface-create :argb32 100 100))
          (with-cairo (cr (cairo-create surface))
            ;; do something
            ))

    * win32 �t�H���g (LOGFONTW) �쐬���[�e�B���e�B��ǉ� (cairo.ext)�B

      0.0.2 �Œǉ����� create-logfontw �͗��p����
      cairo-win32-font-face-create ���g�p���Ă��������B

        (cairo-set-font-face cr (cairo-win32-font-face-create "�l�r �S�V�b�N" :bold t))

    * xxx-extents �� alist �ŕԂ��֐���ǉ��B

      * cairo-scaled-font-extents-alist
      * cairo-scaled-font-text-extents-alist
      * cairo-scaled-font-glyph-extents-alist

      * cairo-font-extents-alist
      * cairo-text-extents-alist
      * cairo-glyph-extents-alist

      * cairo-clip-extents-alist
      * cairo-fill-extents-alist
      * cairo-stroke-extents-alist

: ��݊����܂ޕύX�_

    * cairo-path-list �� cairo::context �\���̂������Ɏ��悤�ɂȂ�܂����B

        (cairo-path-list cr)

    * �K�w�����ꂽ�p�b�P�[�W���̋�؂�� - ���� . �ɂ��܂����B

      * cairo-ffi �� cairo.ffi
      * cairo-util �� cairo.util
      * cairo-ext �� cairo.ext

    * �\���̖��� export ���Ȃ��悤�ɂ��܂����B

    * create-logfontw �� cairo.ext �p�b�P�[�W�Ɉړ����܂����B

      cairo-win32-font-face-create ������� create-logfont �͕s�v���Ǝv���̂�
      export ����̂���߂��B

    * �ȉ��̊֐��͍\���̂ł͂Ȃ����l��Ԃ��悤�ɂȂ�܂����B

      * cairo-scaled-font-extents
      * cairo-scaled-font-text-extents
      * cairo-scaled-font-glyph-extents

      * cairo-font-extents
      * cairo-text-extents
      * cairo-glyph-extents

: �o�O�C��

    * destroy �����I�u�W�F�N�g�ɑ΂��� xxx-get-reference-count ���Ă�ł�������
      �N���b�V������ꍇ���������̂��C�����܂����B

: ���̑�

    * �ȉ��̃T���v����ǉ��B

      * (examples/polygon.l): ���p�`��`�悷��T���v��
      * (examples/pie-chart.l): �~�O���t��`�悷��T���v��
      * (examples/lisp-2.0.l): �^ CM ���̃o�i�[���쐬����T���v��


=== 2007-05-13 / 0.0.2

xycairo 0.0.2 �����[�X!

: �V�K�@�\

    * LOGFONTW ���쐬���邽�߂� create-logfontw �֐���ǉ��B

          (cairo-set-font-face cr (cairo-win32-font-face-create-for-logfontw
                                   (create-logfontw "�l�r �S�V�b�N")))

      examples/show-glyphs-select-font.l, text-japanese.l ���Q�l�ɂ��Ă��������B

: ��݊����܂ޕύX�_

    * �Ȃ�

: �o�O�C��

    * cairo-show-glyphs �ɕ����� glyph ��n�����ꍇ�ɂ��܂��`�悳��Ȃ���������B

    * cairo-reload-dll �����������ă��[�h�ł��Ă��Ȃ����������C���B

    * examples/ �z���̃X�N���v�g�� eval-buffer �Ŏ��s����� $XYZZYHOME/lisp/startup.lc
      �� png �t�@�C���ŏ㏑������Ă��܂��Ă��������C���B

      �ȉ��̊Y��������͂��萔�ł��� startup.lc �̕��������肢���܂��B

      * �Y����:

        examples/ �z���̃X�N���v�g�� eval-buffer �Ŏ��s�����l��
        $XYZZYHOME/lisp/startup.lc �̓��t����e���m�F���Ă��������B

        �X�V�����o�����Ȃ��̂� startup.lc �̓��t���V�����ꍇ��A
        �g���q�� png �ɕς��ĉ摜�r���[�A�ŕ\���ł���l���Y�����܂��B

      * �Ǐ�:

        �_���v�t�@�C���������� xyzzy ���N������ƋN���Ɏ��s���܂��B

      * �C�����@:

        (1) startup.lc ���폜���� xyzzy ���N�����Ă��������B
        (2) �N����AM-x byte-compile-file �����s�� $XYZZYHOME/lisp/startup.l
            ���o�C�g�R���p�C�����Ă��������B

: ���̑�

    * xyzzy/cairo �͒����̂� xycairo �ɕύX�B


=== 2007-05-07 / 0.0.1

xycairo 0.0.1 �����[�X!


=end
