tcl86t.dll      tk86t.dll       tk                    �  &�  �   �   Htk\license.terms tk\text.tcl tk\tk.tcl tk86t.dll zlib1.dll tk\ttk\fonts.tcl tk\ttk\ttk.tcl VCRUNTIME140.dll tk\ttk\utils.tcl tk\ttk\cursors.tcl tcl86t.dll proc _ipc_server {channel clientaddr clientport} {
set client_name [format <%s:%d> $clientaddr $clientport]
chan configure $channel \
-buffering none \
-encoding utf-8 \
-eofchar \x04 \
-translation cr
chan event $channel readable [list _ipc_caller $channel $client_name]
}
proc _ipc_caller {channel client_name} {
chan gets $channel cmd
if {[chan eof $channel]} {
chan close $channel
exit
} elseif {![chan blocked $channel]} {
if {[string match "update_text*" $cmd]} {
global status_text
set first [expr {[string first "(" $cmd] + 1}]
set last [expr {[string last ")" $cmd] - 1}]
set status_text [string range $cmd $first $last]
}
}
}
set server_socket [socket -server _ipc_server -myaddr localhost 0]
set server_port [fconfigure $server_socket -sockname]
set env(_PYIBoot_SPLASH) [lindex $server_port 2]
image create photo splash_image
splash_image put $_image_data
unset _image_data
proc canvas_text_update {canvas tag _var - -} {
upvar $_var var
$canvas itemconfigure $tag -text $var
}
package require Tk
set image_width [image width splash_image]
set image_height [image height splash_image]
set display_width [winfo screenwidth .]
set display_height [winfo screenheight .]
set x_position [expr {int(0.5*($display_width - $image_width))}]
set y_position [expr {int(0.5*($display_height - $image_height))}]
frame .root
canvas .root.canvas \
-width $image_width \
-height $image_height \
-borderwidth 0 \
-highlightthickness 0
.root.canvas create image \
[expr {$image_width / 2}] \
[expr {$image_height / 2}] \
-image splash_image
wm attributes . -transparentcolor magenta
.root.canvas configure -background magenta
pack .root
grid .root.canvas -column 0 -row 0 -columnspan 1 -rowspan 2
wm overrideredirect . 1
wm geometry . +${x_position}+${y_position}
wm attributes . -topmost 1
raise .�PNG

   IHDR   �   �   >��z  &RIDATx��{�յ��]���=�fn000n��	(��	&zcFbL�&� &h"!�@�����F	LNcT��|�@JD�	�!Hf&sa�̍�[ߪjT�0�\���vu�����C�]�骷��k��������`� 8�X����1.B�`�9��"�p����1.B�`�9��"�p����1.B�`�9��"�p�b� 8�s�u�>��:J}-F�1�-���5퓰0i%N#)b|dG��2E7���mo� ��{T
�)P *� q6�X��ɳ�=�as���.�x�����x������O|)�:�����0�y��j9��X 1���׽��h�ߥ����Z��C0?�%��<� =�:�˴��0��r+�˸�j'�o9�����	D4zх��u{���M��EŌ�8^?�f��{�:Ok&D.�(f�5��!D'b"n�ځ�W��qF13 (F#:!V|��eM�!a�"&��^�;��Xwy�B�"�b�&��d�y��7��a��;� b���,��J��P���a���c=��c/}rbūm��\�&������w�w��w�W����bU�$�ԯ���&��f%������d��,.�*F�!"�x7�C�n�����]��")��͍������6���{�Z�M
���0C�&"�G�`/����f���)���Jx&;�&�M�~A�Y�!}�[B �������.�&�@z�>gS�x$�dw]h�p�<��U�� 5K�&[�d��}����U![3.B@?� �X� �r��^��ʜ��_8f�SR��@���h���괔��a�/�dy.B@�����UM�����Ϋ"�[\+X5��"��{>�os�ǲ��\47��6������t0�8����b@��9�؅�h�{B�:�	 S�Ԉ?�46�� �[�Ճ��K_��S�؄��$X_�*��:�l6 -���!���B��PS���,󻘂��DX�!�n\� ���G����������3��ţ�(9����d�^z��W+Dz�,|>E彯P�� Tk�X�
�6d.Bb���-���� i�zxo�<���I��7v>-e.B3�p��쯈P�rh!@Z:����û������@��@\\d�:��x��ʇ� d�AJfg�z�EhVX�+"�7�k$�Ac#�����c�������+�v�D��Yh����� Dqz%�ɱ~���R��AnhP�i���S�aiu��B)�t:�_dƁ�y�^�̀� ����0�u�͂����*G���'�8����������R�h�����;=�-@�?[!�y��s���~�V�'g�p��qEݹsH)��16f~ԉ??�1�{��7�OAϬt�*��ay焆��	�?�sU�i����
�ӂ�j�k/�Uo|���T�	��Vp� e���� �ӂ��Pώc.B@�M���A!�Q�1�p� �׿47>�n��:-���|����"���E��3#�C%�宾�S�k��K���IТɤ����7������8��������XZ�/�x1OI���� a?<TB��i�y�k�����6��ߎ��y�Z�P��<t�iQL��`4Y��5q���X��9�I�r�8&Ԍvl⪛�x�r�v�۝�� ;���ͯ�ʻ��HLz�P	'{�����x��$J}�j�  ��F���7��>q�
�aG�<UͿ
�c&V�XQ�����Y�6q*%NevV�n�YS[T]���J(L�$����u���[��!�P��կ�N���L}�XU��]��' �Iv&����%=g�&? Ђ�ٸ�97��r�.=��Psb�f���}�������t�6����Bq�QZ�� ��Z��O�V��%��@8}h���2�9�p_�,K���U/<T«m��GZ��[�����Tn	���$�E˟Q�[������S���,�6b]��X����`�r�p�5|�j'ܑ~=�5m1w���mwY`�׍���ZU�ktr�!@�xs���7ޒ�
�T��x�#c%���I1�r��X��9��p�E�܋?u����]|����L�}�4���*z��R��7���"d�w���M�1����Dh::7 [3>��e,ej��վ+=M���8�[�Z;���@��	(���&Dt*<�$�bi�����f+Q!B�y�m/��1Cc0$� �x,�z<4�&�-�Px��ԃn�g�ţ�e�O��\]�Y�s� ԏ-B'�%d�=�'{��cnޖ�!u�J����
�*Yx��!\��'$���a����Eqb<��݂{2��f�4��n����㶡C����a��JE�㯆#wGH���ik�S��^��~C}�2���5Jx��~�Q��.F�F�a�wX@)�5�AΙMT���fbU��j���$���dC���t"T�wQ�|�g_D(8,�^��"�S�F�i
dx��B7+���ZɅ�Ob�b�!��NVм8�zҍ/�M6L#B�*���S��1�H��ϐ6���YC�Gh>�I#��+�a�3�Dlo?���z�t��)�����٣1�aU�kT)_A�����&FAq���rʀb��U�����X���P+���j'6�+�B��A.<�� �"�P	wT=K'׿�Nq\Hǐ!�j��1M��V%�P�{A�uB��4	7�S5q������AΙM��ݠ�g2�YDB��w�B�3E�K��b�(��.�;�*^5��8ԩ�#r*V��1D=�n��/@͈���!�bK���{�Ⱥa�Ms����{�M�+�V�zq �4�o*h<���Á�4^M
 ����0� T���_�gM{T!�i�̉��$���q 􊌈�JV��Y[(��� 8����N�J�713%�=��ЕU;ٷF���f���PPN�qO%�։wT=K=���+�J�":�bF�Ϸ�k�_f�(E���XF�#=G3�`� 8P�y7W��B����Q�c����o9D�5��6#b�%{D���.`�������_Or!^�w�y�!DD���pO�;t]��Q��S�4[������?T�=5ws� @�C����B��JT�>y~G3��`�p14Dq�u���{!��%j�������I�BJ���4��Ln�# ě+w҃�������P�t��;���D<���r���WaR�V��,���*��p?���c!%=gpo͋����s!^���M�C~������V�r�{��2"#�G�G"&���@х�ȵ���O�"�qOQ	�垐��5��JXV�L��G����M���}���1�D\�wW�Z����;b:�D�����u{�J,Q>�r�w��gN�OV��cjF"&B�EK��P_v0� �wW�ii�����n�Q%�c-�*D.F&�P�y{Z��B� �R�S
Y-�~+T�P(p!2�����߃彈qBh�YCwRO-h�o�v���|��A�V�er�*2
�����j����.BR�*�WI
��ShB��O��p4�XP�]��:����]Tv�^�)��K��XB�������~"�: ��8��LA!��	�5d*�u�pk8aƼu��4:wp�Ȝ5���R�j�k�{�|.ⰽ�0�N}!ü�C����3F�<����je�:�f�2q�}"�9r17>c��}��5NK�%��=Z��������w��Ho9J�5jw(�NR "kz�:�|� �XKzq��C7B�Lz���1��F�
�[A%@� ;.w%]�ϧ\�)��5\��V'�Y�k���eɳ�}���κ�iɅx��]@�2gsMbAq�q|�]�w�c����?kI/��������Ϥ��@=��u��d# �����8v%�%���i�"�cQ�T�(q*��u+w��G�^G���|b$V�����{��7z$:�6��ߋb(��ث�����π!������0D7
��qj��}�7-x9��'�o&��?�yq����Y֎Ăb��Q�6T-�&�^��/á���.q0����`7u "�Aŋl�r����$�S�E�Sɉ���I����o$O:�O�?Xm�0���Ľ(�ێҥR���T��W�8D$D!wcC�R���1�*��ԅ��O���y��m�PF����{h���	�D�k̨�(��^���x��]���M�*���@����,���������mR!�3�K�'�~�?��Zb���ⶣ�����j/�p�L��:O�Zo}�r��#4iz_1��*U�R2��h TB�ŉSӞط:u!�n�/�]GNM{b�ڦ��u��P�QH(�(µ����ߴ�o��J�"9K�,�B*�$\�ոX��o4�I��ׁTB�5�?L�YC/�	f;&�i���T����ۘ�����p���.J���-T��E���{Q�z��i��h���_���W� V�����},0������(�`Q�T��!;d�G��&�{�u����|���)j�B�h���4���!�a����/�[���#�&��� �i?&o*����֧��1��ĩ���c6|!w�dO#�������"l����H֦L�E�oÂ�ɦ^��vL\�w�=l�/�%N=
�Q�Nw)��Ӌⴻ��	�A%$��=�L-� �S�u)K��qj>l�A��������}5!�-l�u�u���*�wyD� �<�}')魤���A�K��P�nș��]�$�F���/�0t����=T¡�r �E��1�a'�z�����(:XE "��}�z�cB�z���,�V`мf�l�3d�e�\RJ=uL��m�X��$��`�ι� a&[�|b��]eF�"��_a^��DX�[E�N
ō�� V���`[����R��P�[i�LMX"<�S�!��JȶebU�����Af;&�)H�͎5$��ۘH�6+a)�K�A*㡔OG��X���5�~��E]�p4�J�!7,2�~�]�V0Ȣĩ$;.��a\B����!���E�!���RX�J���3mfL(<��i��N�VG����RȨ����&v�ԏ�R�=�����\f�bDD#k�K���-�|Q}k2�*cq�}�9d���d�2�qМ��9EV�Ba��b�\�bKǠ��b������%,I��2|�
⧠��f�P  ��ro�%ID��E��-Gi��M�)��M㡋��G���5Kg���Q�cĂZ�>�0�,7!OG��:����	�*�i�.�S*c�}���5���F�"2C!���}M#�\P���:�jK�%���ff�-��M�ԏn�'���G�"�H��.p�P���
&�B/6lf����p	n(ی��X�%�*{�o��f�p�nF�S<�o��c�F�2%�����~��V*#>Jz��B�%���hd��$�zw�"���3b�!��S���_�"i>#����j0� x���>k��%."~�:����������6��0����'��?������U|��èmт��հc?��z>�e��6��P|Y�lR�"��?T&B�8a���n��Q�2��c��L��>��۪d閺vA��CQJ:+�a"�#���%i>SueJ�������XN�q�<UǶg�b=e���θ#�\����+�P�2�KȮʷ,Sq�7�ů���b`H��.��0J���"#Y3D�Yodwח��5/�JW&
`���!���8	EJ�26tn�BDT���;>�d[S��
�����x.B��P	�]��8FJ�C��O��[W��#�ȵ�TƐ�#�{�l(e��q�ׁ�.�<��~���B�8���2� =���)C��4�@ybA����Q3� ;��?�S=���Ny�K���� d��f�|ƐEǊW �.��T2ɖʎ%$�t��n�N�Rw�~�zĊT��>!�D����0K���p�]�N�2ݑ�V�G��j~��C�C����hͮ%j3�Ty&v)���N�   �rC�!?J2Ą\ ա~_S��
OS��n)b< &!R��a!@��[�/�=y�k���r�/յ��I����U:�3�
�!��.e^���P!�O�j�E����w=�(L����0�P�y	5/��r����z�����pW*Ux���9G�m���{x�N1)��k����F�0�9r�Z  �.Ŋ�m4ܾ�r/��L�;Kl7xG�5���:rX",p䰑�A,���ǬsfI�������
8ʾM�N�z�����CSO��zA�M�!@�X�l��'��&"��S���(�L�g�f%�@, (VV�������ێ��:8U�r�o9D��C���%��L��@�������a�ϲ�Ƃ��<�SɌ����/GLD���׽:ϖ��Ij� ��A��g|�Q�mT-;��Օ�r�����a�@	��q0d	�8���6�KF�����������Ģ�zb�w���gX��~,s=�9���b��%�Z*�1Y�rI�´ո��Є��/3�?�h�a��!ؐm������d���0�qV'
�l8�b*a^�xMBua�0ؔ��O�(v}`�(����lzI������*����ع�ĂRw��u{���p�ejy��b�BM�!s}��Z�7J+Aώ�_ ��Èn/K�1�,���-�,[���ⰽ����0+we|�P�2�P��q+4K��j����d��~�n=���1����P?�(C�bC�a����#��|v� @�X���ѣ0�o�[A�L������tw�&"\�8m3� ���{Z߉Ik8��Ď���kC�Q�ؚ�BS+ �Rm�S�ѽ��`k�ŉ�3� Z-�̈́�Jp�};B{�b *�
��k~?i��ߐ���u!�Z_�m~+&���Xp �n@��Z�xp �n�<���L�+�sٻ���Ͽ�����ι� q6sGӡxQ�\��au@3^�4�@d�c���☴� �r�:§�a@%@���dU�Z>���N,X�<���.����~��a��8����n��bN����Z�G'4��ޕ���������V�
`���9�lH�,���ō�7aY�,]+�i*¹	y$ۖɞ5 ŏoվ�� �M*$���l^Q�(H���O���%%5��XpW�Ul��;��gMbV�o�WM��B*!�6���t�<�pmڒ\�����^���a����M��Q3�x��G,����8&�$Lg�i+&↪1��i�cB͇�׫ׇ�kdV�o��:+f(tI�0c9{1��̩���X-�� a2�p�ê�Q�J ��"Sn�[�"�ι��B�XV�Lu��$L&�?���c]�}��q�����'��ې��#����V$L&Ӟ�Ͷ�Ů/�ōG�'�"F�v�M���-&Lm�b��?Bcuj:�1���GIA|>�M=��Q�<G�=J���n"�vd�d����_���Xwy�zM�o$Ro����;2oÞ���e��V���{����Rf�v� �Gф;pO�2�z�E����teͯԿDc(C����=�E�S��κ#I��a�@!Z���½5/��IȬ�p�%��v�¤O�㺍*���,�{��	+t��@�ͥf��A7�ٳ�+��}��=�8�:I�k؋Z_�=!�#p=��_�{h(�.B �}�Qz��"���i@�P;�݂��\�܅�*������WZLT�Fq�;�Nܚ����`DD� 0��f���?Ġp�@]�?��&}���ŎI�^K��R��q�eV|A"&��=��WW<i�i� Ńi�Ŧ	7��6��/���>��:MeE��Z�-��߈��K�_��� �y�]x�\S��<kE����"끇J8�YF�����d"/Ȁ� ��,�m)�pm�t�]���PYl4��fӝ��[b:��C��ۮS�7�GP�]��I�j�A@a��ԯ������|��c��IDE�PU;����S�XQ4�6ܚ���7���.���������@����Dł*��B<�-ɸ�>��8���ł��Q�������giqg�y�����b�c�Kqkڧcځ3��7�m�|���|����G�� ��W�?A�C�`G�7S��a�չ/Ò�&�[�"�!"�ˤ��´�� a:�L���)n9�b��P�izC�szK���T�0�(L�K�g��a���� 6���>��Vt
1HP�TF�s!
��`��*�$�R͙c>!`� ~(��ԁy�l,���eɳ0�6֐ͤ60\�r/ROGD,�?����ִ>�ߔ�q��H������"L�M�}q���y����>	��0і�K2��3�C���l����@�w݋�-ā�\�������4�6��mM�x1q�q�I�bE�` $�솃� �,:�"�s-	5 `����gfD ?nx�njy�q�\����
LGp�D�-N�6̴��x��$�c�#k_�-uM4��)�@�q.DΥ���t��y��J��%�sL�/��DDaFG{�=�S���(�˝W�ΡŤ=T�͕;iI�Y.D����)H����.1Mb7�"�9a��c���L�a�a��g7�RO"'4/ 	3�-�v&��!��5TG(H�͜M!B �+�("'<S�uc��wǮ`b�j��s�t{�[���1�@�ck���t�
S� �o9D�5�a����J�Y��t"{k���)�ᄍ܍i�ŏ&����)E�%�U?S]�;�=�m0�ƬiE��Ļ��h��}�N�hC g�{�:uaD���a�=��е{Կ��)G��m�
ubT�P��kj��K=�<���ō��x!w���Ĩ!�NOw6�_����έ"'|/��'����ꖇU"r�ic�^6�@�h��E�Q)� ?k:@׷�)�C�{P9abE�&ͳl�Z� ��w��Ң�#܃�	*!ۚ����"F���.���{	��z�^�N@�'�=��1fDd_��tC�l��㘋�kfn�$|s"T/���#��ַ�9��xQ�<{��[�1)� *�ն����W ��{R9�Cqck�Ma�i��OS9!!w�@�w��97d!r^Ʊ�r�x��(�����*�=�!g�pB��!go�՛���.�Q���Fф;Bn��E8*�pg-n��]�,#��r�A%̋��7s�M�܋?u��;���Roc_G%.H �9��"�$�~����_8�wu_�z \�1	���Q4�](����:Oc����5$���TBA|>�o�"d�JwC�{=��%]�P��@�pQF3r7�f��N|.�P��{�]����2��C��UM  �@.P3�A
�4�]h�����֬>�[�FɅw<u���8{D\"N��E�KOM�AX����C%���H]{ϸ�W���߁2oJ�5����D�a�������ԇ~gN�/��l\�&�C�E��}�y�ku���Jh��)u�Q�A��E�܃�rZ �V��w~�Ç�����1�pG��|�F�Éu�9��"�p����1.B�`�9��"�p����1.B�`�9��"�p����1.B�`�?a[����    IEND�B`�