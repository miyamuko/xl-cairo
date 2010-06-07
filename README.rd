= xl-cairo - cairo �𗘗p���� 2D �O���t�B�b�N���C�u����

  * Author: �݂�ނ� ���䂫 ((<URL:mailto:miyamuko@gmail.com>))
  * Home URL: ((<URL:http://miyamuko.s56.xrea.com/xyzzy/cairo/intro.htm>))
  * Version: 1.8.0


== NAME

xl-cairo - cairo �𗘗p���� 2D �O���t�B�b�N���C�u����


== SYNOPSIS

  (require "cairo")
  (use-package :cairo)
  (use-package :cairo.ext)

  (let ((width 300)
        (height 200))
    (with-cairo-surface (surface (cairo-image-surface-create :argb32 width height))
      (with-cairo (cr (cairo-create surface))
        (with-output-to-png (surface (merge-pathnames "test.png" (get-special-folder-location :desktop)))
          (cairo-set-line-width cr 0.04)
          (cairo-scale cr width height)
          (cairo-move-to cr 0.5 0.1)
          (cairo-line-to cr 0.9 0.9)
          (cairo-rel-line-to cr -0.4 0.0)
          (cairo-curve-to cr 0.2 0.9 0.2 0.5 0.5 0.5)
          (cairo-close-path cr)
          (cairo-set-source-rgb cr 0 0 1)
          (cairo-fill-preserve cr)
          (cairo-set-source-rgb cr 0 0 0)
          (cairo-stroke cr)))))


== DESCRIPTION

xl-cairo �� 2D �O���t�B�b�N���C�u�����ł���
((<"cairo"|URL:http://cairographics.org/>))
�� xyzzy ���痘�p���邽�߂̃��C�u�����ł��B

cairo �̓f�o�C�X�Ɉˑ����Ȃ��x�N�g���x�[�X�� API ��񋟂��Ă��܂��B
xl-cairo �ł͂��̂����ȉ��̃o�b�N�G���h���T�|�[�g���Ă��܂��B

  * Windows �̃f�o�C�X�R���e�L�X�g
  * ���[�J���ȃC���[�W�o�b�t�@
  * PNG
  * SVG
  * PDF
  * PostScript


== INSTALL

((<NetInstaller|URL:http://www7a.biglobe.ne.jp/~hat/xyzzy/ni.html>)) �ŃC���X�g�[�������ꍇ�� 3 �ȍ~���A
NetInstaller + ni-autoload ���g���Ă���l�� 4 �ȍ~�� OK �ł��B

(1) �A�[�J�C�u���_�E�����[�h���܂��B

    ((<URL:http://miyamuko.s56.xrea.com/xyzzy/archives/cairo.zip>))

(2) �A�[�J�C�u��W�J���āA$XYZZY/site-lisp �z���Ƀt�@�C�����R�s�[���܂��B

(3) xl-cairo �̓��C�u�����ł��B
    �A�v���P�[�V�����͈ȉ��̃R�[�h��ǉ����邱�Ƃ� cairo �𗘗p���邱�Ƃ��ł��܂��B

      (in-package :you-application-package)
      (require "cairo")
      (use-package :cairo)
      (use-package :cairo.ext)

    use-package ����Ƃ������̃V���{�����p�b�P�[�W�C���q�Ȃ��ŎQ�Ƃł���悤�ɂȂ�܂��B
    ���A���\��ʓI�Ȗ��O���g���Ă���̂ŁA editor �� user �ł� use-package ������
    �����̃A�v����p�̃p�b�P�[�W�� use-package �������������ł��傤�B

    cairo.ext �ɂ͏����� cairo �o�C���f�B���O�ł͂Ȃ��Ǝ��g�����`���Ă��܂��B


== MODULE

=== PACKAGE

cairo �͈ȉ��̃p�b�P�[�W�𗘗p���Ă��܂��B

  * cairo (nickname cairo.api)
  * cairo.ext
  * cairo.util
  * cairo.ffi


=== EXPORT

���Ƃł����B

=== VARIABLE

���Ƃł����B

=== COMMAND

���Ƃł����B

=== FUNCTION

((<"Cairo: A Vector Graphics Library"|URL:http://www.cairographics.org/manual/>))
��
((<"Rubyist Magazine - cairo: 2 �����摜�`�惉�C�u����"|URL:http://jp.rubyist.net/magazine/?0019-cairo>))
��
((<"rcairo �̃h�L�������g"|URL:http://cairo.rubyforge.org/doc/ja/>))
���Q�Ƃ��Ă��������B

�����܂���B


== TODO

* This object is owned by cairo. To keep a reference to it, you must call cairo_font_face_reference. 
* cairo-font-options �� alist �� set/get
* destory �� assert �ŗ�����̂� cairo ���x���łǂ��ɂ�����B
* cairo-image-surface-create-for-data �̃e�X�g
* �}�N��
  * short name/auto bind
  * do-tuples (from On Lisp)
* test, documents
* stdcall
* cairo-scaled-font-create �̈���
* with-cairo-group �̃e�X�g
* with-cairo-fill, with-cairo-stroke �Œ��� cairo-new-path ���ׂ���?
  * rcairo �͂��Ă���
  * �����Ő���ł���悤�ɂ���?
* surface �� cairo-get-target �����Ƃ��Ȃǂ�:
  * reference count �͑��₷�ׂ�?
  * ���� lisp �\���̂�Ԃ����ق���������? �ꉞ eq �Ŕ�r�ł��邵...
* win32-surface-create �̓���?
* xxx-get-yyy, xxx-set-yyy �� xxx-yyy �݂̂ɂ���B set �� setf �ŁB
* cairo.ext
  * rcairo �g���̎�荞��
    * pseudo_blur
    * �ȂǂȂ�
  * ��
    * �g�`�W�F�l���[�^ (path ��)
* cairo-show-text-glyphs, cairo-scaled-font-text-to-glyphs �̃e�X�g


== KNOWN BUGS

* �h�L�������g���Ȃ�


== AUTHOR

�݂�ނ� ���䂫 (((<URL:mailto:miyamuko (at) gmail.com>)))


== SEE ALSO

  : cairo
        ((<URL:http://cairographics.org/>))

  : Cairo: A Vector Graphics Library
        ((<URL:http://www.cairographics.org/manual/>))

  : Cairo samples
        ((<URL:http://cairographics.org/samples/>))

  : rcairo reference manual (���{��)
        ((<URL:http://cairo.rubyforge.org/doc/ja/>))

  : Rubyist Magazine - cairo: 2 �����摜�`�惉�C�u����
        ((<URL:http://jp.rubyist.net/magazine/?0019-cairo>))

  : cairo ���g�����N���X�v���b�g�t�H�[���E�O���t�B�b�N�X
        ((<URL:http://www.ibm.com/developerworks/jp/linux/library/l-cairo/index.html>))

  : ��3�� �j�ƂȂ�Z�p
        ((<URL:http://www.gnome.gr.jp/docs/g2-platform-overview/ch03.html#cairo>))

  : CLiki : cl-cairo2
        ((<URL:http://www.cliki.net/cl-cairo2>))

  : CLiki : cffi-cairo
        ((<URL:http://www.cliki.net/cffi-cairo>))

  : zlib Home Site
        ((<URL:http://www.zlib.net/>))

  : libpng Home Page
        ((<URL:http://www.libpng.org/pub/png/libpng.html>))


== COPYRIGHT

=== xl-cairo (this library)

xl-cairo �� MIT/X ���C�Z���X�ɂ��������ė��p�\�ł��B

See cairo/docs/MIT-LICENSE for full license.

xl-cairo �͈ȉ��̃\�t�g�E�F�A���܂�ł��܂��B
�����̃\�t�g�E�F�A�̃��C�Z���X�ɂ��Ă� cairo/docs �f�B���N�g�����Q�Ƃ��Ă��������B

  * cairo 1.8.8 + patch
  * libpng 1.2.8
  * zlib 1.2.3

==== cairo

xl-cairo �� xyzzy �̃o�O��������邽�߂ɁAcairo 1.8.8 ���C�����ė��p���Ă��܂��B

�C�����e�ɂ��Ă� cairo/src/patch/cairo-1.8.8-return-double.patch ���Q�Ƃ��Ă��������B

See cairo/docs/cairo/COPYING for full license.

==== zlib

See cairo/docs/zlib/README.txt for full license.

==== libpng

See cairo/docs/libpng/LICENSE for full license.


== NEWS

<<<NEWS.rd

=end
