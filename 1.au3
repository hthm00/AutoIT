#NoTrayIcon
#RequireAdmin
;~ #include "D:\desktop\enscript\MCFinclude.au3"
Global Const $mb_ok = 0
Global Const $mb_okcancel = 1
Global Const $mb_abortretryignore = 2
Global Const $mb_yesnocancel = 3
Global Const $mb_yesno = 4
Global Const $mb_retrycancel = 5
Global Const $mb_canceltrycontinue = 6
Global Const $mb_help = 16384
Global Const $mb_iconstop = 16
Global Const $mb_iconerror = 16
Global Const $mb_iconhand = 16
Global Const $mb_iconquestion = 32
Global Const $mb_iconexclamation = 48
Global Const $mb_iconwarning = 48
Global Const $mb_iconinformation = 64
Global Const $mb_iconasterisk = 64
Global Const $mb_usericon = 128
Global Const $mb_defbutton1 = 0
Global Const $mb_defbutton2 = 256
Global Const $mb_defbutton3 = 512
Global Const $mb_defbutton4 = 768
Global Const $mb_applmodal = 0
Global Const $mb_systemmodal = 4096
Global Const $mb_taskmodal = 8192
Global Const $mb_default_desktop_only = 131072
Global Const $mb_right = 524288
Global Const $mb_rtlreading = 1048576
Global Const $mb_setforeground = 65536
Global Const $mb_topmost = 262144
Global Const $mb_service_notification = 2097152
Global Const $mb_rightjustified = $mb_right
Global Const $idtimeout = -1
Global Const $idok = 1
Global Const $idcancel = 2
Global Const $idabort = 3
Global Const $idretry = 4
Global Const $idignore = 5
Global Const $idyes = 6
Global Const $idno = 7
Global Const $idclose = 8
Global Const $idhelp = 9
Global Const $idtryagain = 10
Global Const $idcontinue = 11
Global Const $bs_groupbox = 7
Global Const $bs_bottom = 2048
Global Const $bs_center = 768
Global Const $bs_defpushbutton = 1
Global Const $bs_left = 256
Global Const $bs_multiline = 8192
Global Const $bs_pushbox = 10
Global Const $bs_pushlike = 4096
Global Const $bs_right = 512
Global Const $bs_rightbutton = 32
Global Const $bs_top = 1024
Global Const $bs_vcenter = 3072
Global Const $bs_flat = 32768
Global Const $bs_icon = 64
Global Const $bs_bitmap = 128
Global Const $bs_notify = 16384
Global Const $bs_splitbutton = 12
Global Const $bs_defsplitbutton = 13
Global Const $bs_commandlink = 14
Global Const $bs_defcommandlink = 15
Global Const $bcsif_glyph = 1
Global Const $bcsif_image = 2
Global Const $bcsif_style = 4
Global Const $bcsif_size = 8
Global Const $bcss_nosplit = 1
Global Const $bcss_stretch = 2
Global Const $bcss_alignleft = 4
Global Const $bcss_image = 8
Global Const $button_imagelist_align_left = 0
Global Const $button_imagelist_align_right = 1
Global Const $button_imagelist_align_top = 2
Global Const $button_imagelist_align_bottom = 3
Global Const $button_imagelist_align_center = 4
Global Const $bs_3state = 5
Global Const $bs_auto3state = 6
Global Const $bs_autocheckbox = 3
Global Const $bs_checkbox = 2
Global Const $bs_radiobutton = 4
Global Const $bs_autoradiobutton = 9
Global Const $bs_ownerdraw = 11
Global Const $gui_ss_default_button = 0
Global Const $gui_ss_default_checkbox = 0
Global Const $gui_ss_default_group = 0
Global Const $gui_ss_default_radio = 0
Global Const $bcm_first = 5632
Global Const $bcm_getidealsize = ($bcm_first + 1)
Global Const $bcm_getimagelist = ($bcm_first + 3)
Global Const $bcm_getnote = ($bcm_first + 10)
Global Const $bcm_getnotelength = ($bcm_first + 11)
Global Const $bcm_getsplitinfo = ($bcm_first + 8)
Global Const $bcm_gettextmargin = ($bcm_first + 5)
Global Const $bcm_setdropdownstate = ($bcm_first + 6)
Global Const $bcm_setimagelist = ($bcm_first + 2)
Global Const $bcm_setnote = ($bcm_first + 9)
Global Const $bcm_setshield = ($bcm_first + 12)
Global Const $bcm_setsplitinfo = ($bcm_first + 7)
Global Const $bcm_settextmargin = ($bcm_first + 4)
Global Const $bm_click = 245
Global Const $bm_getcheck = 240
Global Const $bm_getimage = 246
Global Const $bm_getstate = 242
Global Const $bm_setcheck = 241
Global Const $bm_setdontclick = 248
Global Const $bm_setimage = 247
Global Const $bm_setstate = 243
Global Const $bm_setstyle = 244
Global Const $bcn_first = -1250
Global Const $bcn_dropdown = ($bcn_first + 2)
Global Const $bcn_hotitemchange = ($bcn_first + 1)
Global Const $bn_clicked = 0
Global Const $bn_paint = 1
Global Const $bn_hilite = 2
Global Const $bn_unhilite = 3
Global Const $bn_disable = 4
Global Const $bn_doubleclicked = 5
Global Const $bn_setfocus = 6
Global Const $bn_killfocus = 7
Global Const $bn_pushed = $bn_hilite
Global Const $bn_unpushed = $bn_unhilite
Global Const $bn_dblclk = $bn_doubleclicked
Global Const $bst_checked = 1
Global Const $bst_indeterminate = 2
Global Const $bst_unchecked = 0
Global Const $bst_focus = 8
Global Const $bst_pushed = 4
Global Const $bst_dontclick = 128
Global Const $gui_event_single = 0
Global Const $gui_event_array = 1
Global Const $gui_event_none = 0
Global Const $gui_event_close = -3
Global Const $gui_event_minimize = -4
Global Const $gui_event_restore = -5
Global Const $gui_event_maximize = -6
Global Const $gui_event_primarydown = -7
Global Const $gui_event_primaryup = -8
Global Const $gui_event_secondarydown = -9
Global Const $gui_event_secondaryup = -10
Global Const $gui_event_mousemove = -11
Global Const $gui_event_resized = -12
Global Const $gui_event_dropped = -13
Global Const $gui_rundefmsg = "GUI_RUNDEFMSG"
Global Const $gui_avistop = 0
Global Const $gui_avistart = 1
Global Const $gui_aviclose = 2
Global Const $gui_checked = 1
Global Const $gui_indeterminate = 2
Global Const $gui_unchecked = 4
Global Const $gui_dropaccepted = 8
Global Const $gui_nodropaccepted = 4096
Global Const $gui_acceptfiles = $gui_dropaccepted
Global Const $gui_show = 16
Global Const $gui_hide = 32
Global Const $gui_enable = 64
Global Const $gui_disable = 128
Global Const $gui_focus = 256
Global Const $gui_nofocus = 8192
Global Const $gui_defbutton = 512
Global Const $gui_expand = 1024
Global Const $gui_ontop = 2048
Global Const $gui_fontnormal = 0
Global Const $gui_fontitalic = 2
Global Const $gui_fontunder = 4
Global Const $gui_fontstrike = 8
Global Const $gui_dockauto = 1
Global Const $gui_dockleft = 2
Global Const $gui_dockright = 4
Global Const $gui_dockhcenter = 8
Global Const $gui_docktop = 32
Global Const $gui_dockbottom = 64
Global Const $gui_dockvcenter = 128
Global Const $gui_dockwidth = 256
Global Const $gui_dockheight = 512
Global Const $gui_docksize = 768
Global Const $gui_dockmenubar = 544
Global Const $gui_dockstatebar = 576
Global Const $gui_dockall = 802
Global Const $gui_dockborders = 102
Global Const $gui_gr_close = 1
Global Const $gui_gr_line = 2
Global Const $gui_gr_bezier = 4
Global Const $gui_gr_move = 6
Global Const $gui_gr_color = 8
Global Const $gui_gr_rect = 10
Global Const $gui_gr_ellipse = 12
Global Const $gui_gr_pie = 14
Global Const $gui_gr_dot = 16
Global Const $gui_gr_pixel = 18
Global Const $gui_gr_hint = 20
Global Const $gui_gr_refresh = 22
Global Const $gui_gr_pensize = 24
Global Const $gui_gr_nobkcolor = -2
Global Const $gui_bkcolor_default = -1
Global Const $gui_bkcolor_transparent = -2
Global Const $gui_bkcolor_lv_alternate = -33554432
Global Const $gui_read_default = 0
Global Const $gui_read_extended = 1
Global Const $gui_cursor_nooverride = 0
Global Const $gui_cursor_override = 1
Global Const $gui_ws_ex_parentdrag = 1048576
Global Const $ss_left = 0
Global Const $ss_center = 1
Global Const $ss_right = 2
Global Const $ss_icon = 3
Global Const $ss_blackrect = 4
Global Const $ss_grayrect = 5
Global Const $ss_whiterect = 6
Global Const $ss_blackframe = 7
Global Const $ss_grayframe = 8
Global Const $ss_whiteframe = 9
Global Const $ss_simple = 11
Global Const $ss_leftnowordwrap = 12
Global Const $ss_bitmap = 14
Global Const $ss_enhmetafile = 15
Global Const $ss_etchedhorz = 16
Global Const $ss_etchedvert = 17
Global Const $ss_etchedframe = 18
Global Const $ss_realsizecontrol = 64
Global Const $ss_noprefix = 128
Global Const $ss_notify = 256
Global Const $ss_centerimage = 512
Global Const $ss_rightjust = 1024
Global Const $ss_sunken = 4096
Global Const $gui_ss_default_label = 0
Global Const $gui_ss_default_graphic = 0
Global Const $gui_ss_default_icon = $ss_notify
Global Const $gui_ss_default_pic = $ss_notify
Global Const $stm_seticon = 368
Global Const $stm_geticon = 369
Global Const $stm_setimage = 370
Global Const $stm_getimage = 371
Global Const $wc_animate = "SysAnimate32"
Global Const $wc_button = "Button"
Global Const $wc_combobox = "ComboBox"
Global Const $wc_comboboxex = "ComboBoxEx32"
Global Const $wc_datetimepick = "SysDateTimePick32"
Global Const $wc_edit = "Edit"
Global Const $wc_header = "SysHeader32"
Global Const $wc_hotkey = "msctls_hotkey32"
Global Const $wc_ipaddress = "SysIPAddress32"
Global Const $wc_link = "SysLink"
Global Const $wc_listbox = "ListBox"
Global Const $wc_listview = "SysListView32"
Global Const $wc_monthcal = "SysMonthCal32"
Global Const $wc_nativefontctl = "NativeFontCtl"
Global Const $wc_pagescroller = "SysPager"
Global Const $wc_progress = "msctls_progress32"
Global Const $wc_rebar = "ReBarWindow32"
Global Const $wc_scrollbar = "ScrollBar"
Global Const $wc_static = "Static"
Global Const $wc_statusbar = "msctls_statusbar32"
Global Const $wc_tabcontrol = "SysTabControl32"
Global Const $wc_toolbar = "ToolbarWindow32"
Global Const $wc_tooltips = "tooltips_class32"
Global Const $wc_trackbar = "msctls_trackbar32"
Global Const $wc_treeview = "SysTreeView32"
Global Const $wc_updown = "msctls_updown32"
Global Const $ws_overlapped = 0
Global Const $ws_tiled = $ws_overlapped
Global Const $ws_maximizebox = 65536
Global Const $ws_minimizebox = 131072
Global Const $ws_tabstop = 65536
Global Const $ws_group = 131072
Global Const $ws_sizebox = 262144
Global Const $ws_thickframe = $ws_sizebox
Global Const $ws_sysmenu = 524288
Global Const $ws_hscroll = 1048576
Global Const $ws_vscroll = 2097152
Global Const $ws_dlgframe = 4194304
Global Const $ws_border = 8388608
Global Const $ws_caption = 12582912
Global Const $ws_overlappedwindow = BitOR($ws_caption, $ws_maximizebox, $ws_minimizebox, $ws_overlapped, $ws_sysmenu, $ws_thickframe)
Global Const $ws_tiledwindow = $ws_overlappedwindow
Global Const $ws_maximize = 16777216
Global Const $ws_clipchildren = 33554432
Global Const $ws_clipsiblings = 67108864
Global Const $ws_disabled = 134217728
Global Const $ws_visible = 268435456
Global Const $ws_minimize = 536870912
Global Const $ws_iconic = $ws_minimize
Global Const $ws_child = 1073741824
Global Const $ws_childwindow = $ws_child
Global Const $ws_popup = --2147483648
Global Const $ws_popupwindow = -2138570752
Global Const $ds_3dlook = 4
Global Const $ds_absalign = 1
Global Const $ds_center = 2048
Global Const $ds_centermouse = 4096
Global Const $ds_contexthelp = 8192
Global Const $ds_control = 1024
Global Const $ds_fixedsys = 8
Global Const $ds_localedit = 32
Global Const $ds_modalframe = 128
Global Const $ds_nofailcreate = 16
Global Const $ds_noidlemsg = 256
Global Const $ds_setfont = 64
Global Const $ds_setforeground = 512
Global Const $ds_shellfont = BitOR($ds_fixedsys, $ds_setfont)
Global Const $ds_sysmodal = 2
Global Const $ws_ex_acceptfiles = 16
Global Const $ws_ex_appwindow = 262144
Global Const $ws_ex_composited = 33554432
Global Const $ws_ex_controlparent = 65536
Global Const $ws_ex_clientedge = 512
Global Const $ws_ex_contexthelp = 1024
Global Const $ws_ex_dlgmodalframe = 1
Global Const $ws_ex_layered = 524288
Global Const $ws_ex_layoutrtl = 4194304
Global Const $ws_ex_left = 0
Global Const $ws_ex_leftscrollbar = 16384
Global Const $ws_ex_ltrreading = 0
Global Const $ws_ex_mdichild = 64
Global Const $ws_ex_noactivate = 134217728
Global Const $ws_ex_noinheritlayout = 1048576
Global Const $ws_ex_noparentnotify = 4
Global Const $ws_ex_right = 4096
Global Const $ws_ex_rightscrollbar = 0
Global Const $ws_ex_rtlreading = 8192
Global Const $ws_ex_staticedge = 131072
Global Const $ws_ex_toolwindow = 128
Global Const $ws_ex_topmost = 8
Global Const $ws_ex_transparent = 32
Global Const $ws_ex_windowedge = 256
Global Const $ws_ex_overlappedwindow = BitOR($ws_ex_clientedge, $ws_ex_windowedge)
Global Const $ws_ex_palettewindow = BitOR($ws_ex_toolwindow, $ws_ex_topmost, $ws_ex_windowedge)
Global Const $wm_null = 0
Global Const $wm_create = 1
Global Const $wm_destroy = 2
Global Const $wm_move = 3
Global Const $wm_sizewait = 4
Global Const $wm_size = 5
Global Const $wm_activate = 6
Global Const $wm_setfocus = 7
Global Const $wm_killfocus = 8
Global Const $wm_setvisible = 9
Global Const $wm_enable = 10
Global Const $wm_setredraw = 11
Global Const $wm_settext = 12
Global Const $wm_gettext = 13
Global Const $wm_gettextlength = 14
Global Const $wm_paint = 15
Global Const $wm_close = 16
Global Const $wm_queryendsession = 17
Global Const $wm_quit = 18
Global Const $wm_erasebkgnd = 20
Global Const $wm_queryopen = 19
Global Const $wm_syscolorchange = 21
Global Const $wm_endsession = 22
Global Const $wm_systemerror = 23
Global Const $wm_showwindow = 24
Global Const $wm_ctlcolor = 25
Global Const $wm_settingchange = 26
Global Const $wm_wininichange = 26
Global Const $wm_devmodechange = 27
Global Const $wm_activateapp = 28
Global Const $wm_fontchange = 29
Global Const $wm_timechange = 30
Global Const $wm_cancelmode = 31
Global Const $wm_setcursor = 32
Global Const $wm_mouseactivate = 33
Global Const $wm_childactivate = 34
Global Const $wm_queuesync = 35
Global Const $wm_getminmaxinfo = 36
Global Const $wm_logoff = 37
Global Const $wm_painticon = 38
Global Const $wm_iconerasebkgnd = 39
Global Const $wm_nextdlgctl = 40
Global Const $wm_alttabactive = 41
Global Const $wm_spoolerstatus = 42
Global Const $wm_drawitem = 43
Global Const $wm_measureitem = 44
Global Const $wm_deleteitem = 45
Global Const $wm_vkeytoitem = 46
Global Const $wm_chartoitem = 47
Global Const $wm_setfont = 48
Global Const $wm_getfont = 49
Global Const $wm_sethotkey = 50
Global Const $wm_gethotkey = 51
Global Const $wm_filesyschange = 52
Global Const $wm_isactiveicon = 53
Global Const $wm_queryparkicon = 54
Global Const $wm_querydragicon = 55
Global Const $wm_winhelp = 56
Global Const $wm_compareitem = 57
Global Const $wm_fullscreen = 58
Global Const $wm_clientshutdown = 59
Global Const $wm_ddemlevent = 60
Global Const $wm_getobject = 61
Global Const $wm_calcscroll = 63
Global Const $wm_testing = 64
Global Const $wm_compacting = 65
Global Const $wm_otherwindowcreated = 66
Global Const $wm_otherwindowdestroyed = 67
Global Const $wm_commnotify = 68
Global Const $wm_mediastatuschange = 69
Global Const $wm_windowposchanging = 70
Global Const $wm_windowposchanged = 71
Global Const $wm_power = 72
Global Const $wm_copyglobaldata = 73
Global Const $wm_copydata = 74
Global Const $wm_canceljournal = 75
Global Const $wm_logonnotify = 76
Global Const $wm_keyf1 = 77
Global Const $wm_notify = 78
Global Const $wm_access_window = 79
Global Const $wm_inputlangchangerequest = 80
Global Const $wm_inputlangchange = 81
Global Const $wm_tcard = 82
Global Const $wm_help = 83
Global Const $wm_userchanged = 84
Global Const $wm_notifyformat = 85
Global Const $wm_qm_activate = 96
Global Const $wm_hook_do_callback = 97
Global Const $wm_syscopydata = 98
Global Const $wm_finaldestroy = 112
Global Const $wm_measureitem_clientdata = 113
Global Const $wm_contextmenu = 123
Global Const $wm_stylechanging = 124
Global Const $wm_stylechanged = 125
Global Const $wm_displaychange = 126
Global Const $wm_geticon = 127
Global Const $wm_seticon = 128
Global Const $wm_nccreate = 129
Global Const $wm_ncdestroy = 130
Global Const $wm_nccalcsize = 131
Global Const $wm_nchittest = 132
Global Const $wm_ncpaint = 133
Global Const $wm_ncactivate = 134
Global Const $wm_getdlgcode = 135
Global Const $wm_syncpaint = 136
Global Const $wm_synctask = 137
Global Const $wm_kludgeminrect = 139
Global Const $wm_lpkdrawswitchwnd = 140
Global Const $wm_uahdestroywindow = 144
Global Const $wm_uahdrawmenu = 145
Global Const $wm_uahdrawmenuitem = 146
Global Const $wm_uahinitmenu = 147
Global Const $wm_uahmeasuremenuitem = 148
Global Const $wm_uahncpaintmenupopup = 149
Global Const $wm_ncmousemove = 160
Global Const $wm_nclbuttondown = 161
Global Const $wm_nclbuttonup = 162
Global Const $wm_nclbuttondblclk = 163
Global Const $wm_ncrbuttondown = 164
Global Const $wm_ncrbuttonup = 165
Global Const $wm_ncrbuttondblclk = 166
Global Const $wm_ncmbuttondown = 167
Global Const $wm_ncmbuttonup = 168
Global Const $wm_ncmbuttondblclk = 169
Global Const $wm_ncxbuttondown = 171
Global Const $wm_ncxbuttonup = 172
Global Const $wm_ncxbuttondblclk = 173
Global Const $wm_ncuahdrawcaption = 174
Global Const $wm_ncuahdrawframe = 175
Global Const $wm_input_device_change = 254
Global Const $wm_input = 255
Global Const $wm_keydown = 256
Global Const $wm_keyfirst = 256
Global Const $wm_keyup = 257
Global Const $wm_char = 258
Global Const $wm_deadchar = 259
Global Const $wm_syskeydown = 260
Global Const $wm_syskeyup = 261
Global Const $wm_syschar = 262
Global Const $wm_sysdeadchar = 263
Global Const $wm_yomichar = 264
Global Const $wm_keylast = 265
Global Const $wm_unichar = 265
Global Const $wm_convertrequest = 266
Global Const $wm_convertresult = 267
Global Const $wm_im_info = 268
Global Const $wm_ime_startcomposition = 269
Global Const $wm_ime_endcomposition = 270
Global Const $wm_ime_composition = 271
Global Const $wm_ime_keylast = 271
Global Const $wm_initdialog = 272
Global Const $wm_command = 273
Global Const $wm_syscommand = 274
Global Const $wm_timer = 275
Global Const $wm_hscroll = 276
Global Const $wm_vscroll = 277
Global Const $wm_initmenu = 278
Global Const $wm_initmenupopup = 279
Global Const $wm_systimer = 280
Global Const $wm_gesture = 281
Global Const $wm_gesturenotify = 282
Global Const $wm_gestureinput = 283
Global Const $wm_gesturenotified = 284
Global Const $wm_menuselect = 287
Global Const $wm_menuchar = 288
Global Const $wm_enteridle = 289
Global Const $wm_menurbuttonup = 290
Global Const $wm_menudrag = 291
Global Const $wm_menugetobject = 292
Global Const $wm_uninitmenupopup = 293
Global Const $wm_menucommand = 294
Global Const $wm_changeuistate = 295
Global Const $wm_updateuistate = 296
Global Const $wm_queryuistate = 297
Global Const $wm_lbtrackpoint = 305
Global Const $wm_ctlcolormsgbox = 306
Global Const $wm_ctlcoloredit = 307
Global Const $wm_ctlcolorlistbox = 308
Global Const $wm_ctlcolorbtn = 309
Global Const $wm_ctlcolordlg = 310
Global Const $wm_ctlcolorscrollbar = 311
Global Const $wm_ctlcolorstatic = 312
Global Const $mn_gethmenu = 481
Global Const $wm_parentnotify = 528
Global Const $wm_entermenuloop = 529
Global Const $wm_exitmenuloop = 530
Global Const $wm_nextmenu = 531
Global Const $wm_sizing = 532
Global Const $wm_capturechanged = 533
Global Const $wm_moving = 534
Global Const $wm_powerbroadcast = 536
Global Const $wm_devicechange = 537
Global Const $wm_mdicreate = 544
Global Const $wm_mdidestroy = 545
Global Const $wm_mdiactivate = 546
Global Const $wm_mdirestore = 547
Global Const $wm_mdinext = 548
Global Const $wm_mdimaximize = 549
Global Const $wm_mditile = 550
Global Const $wm_mdicascade = 551
Global Const $wm_mdiiconarrange = 552
Global Const $wm_mdigetactive = 553
Global Const $wm_dropobject = 554
Global Const $wm_querydropobject = 555
Global Const $wm_begindrag = 556
Global Const $wm_dragloop = 557
Global Const $wm_dragselect = 558
Global Const $wm_dragmove = 559
Global Const $wm_mdisetmenu = 560
Global Const $wm_entersizemove = 561
Global Const $wm_exitsizemove = 562
Global Const $wm_dropfiles = 563
Global Const $wm_mdirefreshmenu = 564
Global Const $wm_touch = 576
Global Const $wm_ime_setcontext = 641
Global Const $wm_ime_notify = 642
Global Const $wm_ime_control = 643
Global Const $wm_ime_compositionfull = 644
Global Const $wm_ime_select = 645
Global Const $wm_ime_char = 646
Global Const $wm_ime_system = 647
Global Const $wm_ime_request = 648
Global Const $wm_ime_keydown = 656
Global Const $wm_ime_keyup = 657
Global Const $wm_ncmousehover = 672
Global Const $wm_mousehover = 673
Global Const $wm_ncmouseleave = 674
Global Const $wm_mouseleave = 675
Global Const $wm_wtssession_change = 689
Global Const $wm_tablet_first = 704
Global Const $wm_tablet_last = 735
Global Const $wm_cut = 768
Global Const $wm_copy = 769
Global Const $wm_paste = 770
Global Const $wm_clear = 771
Global Const $wm_undo = 772
Global Const $wm_paletteischanging = 784
Global Const $wm_hotkey = 786
Global Const $wm_palettechanged = 785
Global Const $wm_sysmenu = 787
Global Const $wm_hookmsg = 788
Global Const $wm_exitprocess = 789
Global Const $wm_wakethread = 790
Global Const $wm_print = 791
Global Const $wm_printclient = 792
Global Const $wm_appcommand = 793
Global Const $wm_querynewpalette = 783
Global Const $wm_themechanged = 794
Global Const $wm_uahinit = 795
Global Const $wm_desktopnotify = 796
Global Const $wm_clipboardupdate = 797
Global Const $wm_dwmcompositionchanged = 798
Global Const $wm_dwmncrenderingchanged = 799
Global Const $wm_dwmcolorizationcolorchanged = 800
Global Const $wm_dwmwindowmaximizedchange = 801
Global Const $wm_dwmexileframe = 802
Global Const $wm_dwmsendiconicthumbnail = 803
Global Const $wm_magnification_started = 804
Global Const $wm_magnification_ended = 805
Global Const $wm_dwmsendiconiclivepreviewbitmap = 806
Global Const $wm_dwmthumbnailsizechanged = 807
Global Const $wm_magnification_output = 808
Global Const $wm_measurecontrol = 816
Global Const $wm_getactiontext = 817
Global Const $wm_forwardkeydown = 819
Global Const $wm_forwardkeyup = 820
Global Const $wm_gettitlebarinfoex = 831
Global Const $wm_notifywow = 832
Global Const $wm_handheldfirst = 856
Global Const $wm_handheldlast = 863
Global Const $wm_afxfirst = 864
Global Const $wm_afxlast = 895
Global Const $wm_penwinfirst = 896
Global Const $wm_penwinlast = 911
Global Const $wm_dde_initiate = 992
Global Const $wm_dde_terminate = 993
Global Const $wm_dde_advise = 994
Global Const $wm_dde_unadvise = 995
Global Const $wm_dde_ack = 996
Global Const $wm_dde_data = 997
Global Const $wm_dde_request = 998
Global Const $wm_dde_poke = 999
Global Const $wm_dde_execute = 1000
Global Const $wm_dbnotification = 1021
Global Const $wm_netconnect = 1022
Global Const $wm_hibernate = 1023
Global Const $wm_user = 1024
Global Const $wm_app = 32768
Global Const $nm_first = 0
Global Const $nm_outofmemory = $nm_first - 1
Global Const $nm_click = $nm_first - 2
Global Const $nm_dblclk = $nm_first - 3
Global Const $nm_return = $nm_first - 4
Global Const $nm_rclick = $nm_first - 5
Global Const $nm_rdblclk = $nm_first - 6
Global Const $nm_setfocus = $nm_first - 7
Global Const $nm_killfocus = $nm_first - 8
Global Const $nm_customdraw = $nm_first - 12
Global Const $nm_hover = $nm_first - 13
Global Const $nm_nchittest = $nm_first - 14
Global Const $nm_keydown = $nm_first - 15
Global Const $nm_releasedcapture = $nm_first - 16
Global Const $nm_setcursor = $nm_first - 17
Global Const $nm_char = $nm_first - 18
Global Const $nm_tooltipscreated = $nm_first - 19
Global Const $nm_ldown = $nm_first - 20
Global Const $nm_rdown = $nm_first - 21
Global Const $nm_themechanged = $nm_first - 22
Global Const $wm_mousefirst = 512
Global Const $wm_mousemove = 512
Global Const $wm_lbuttondown = 513
Global Const $wm_lbuttonup = 514
Global Const $wm_lbuttondblclk = 515
Global Const $wm_rbuttondown = 516
Global Const $wm_rbuttonup = 517
Global Const $wm_rbuttondblclk = 518
Global Const $wm_mbuttondown = 519
Global Const $wm_mbuttonup = 520
Global Const $wm_mbuttondblclk = 521
Global Const $wm_mousewheel = 522
Global Const $wm_xbuttondown = 523
Global Const $wm_xbuttonup = 524
Global Const $wm_xbuttondblclk = 525
Global Const $wm_mousehwheel = 526
Global Const $ps_solid = 0
Global Const $ps_dash = 1
Global Const $ps_dot = 2
Global Const $ps_dashdot = 3
Global Const $ps_dashdotdot = 4
Global Const $ps_null = 5
Global Const $ps_insideframe = 6
Global Const $ps_userstyle = 7
Global Const $ps_alternate = 8
Global Const $ps_endcap_round = 0
Global Const $ps_endcap_square = 256
Global Const $ps_endcap_flat = 512
Global Const $ps_join_bevel = 4096
Global Const $ps_join_miter = 8192
Global Const $ps_join_round = 0
Global Const $ps_geometric = 65536
Global Const $ps_cosmetic = 0
Global Const $lwa_alpha = 2
Global Const $lwa_colorkey = 1
Global Const $rgn_and = 1
Global Const $rgn_or = 2
Global Const $rgn_xor = 3
Global Const $rgn_diff = 4
Global Const $rgn_copy = 5
Global Const $errorregion = 0
Global Const $nullregion = 1
Global Const $simpleregion = 2
Global Const $complexregion = 3
Global Const $transparent = 1
Global Const $opaque = 2
Global Const $ccm_first = 8192
Global Const $ccm_getunicodeformat = ($ccm_first + 6)
Global Const $ccm_setunicodeformat = ($ccm_first + 5)
Global Const $ccm_setbkcolor = $ccm_first + 1
Global Const $ccm_setcolorscheme = $ccm_first + 2
Global Const $ccm_getcolorscheme = $ccm_first + 3
Global Const $ccm_getdroptarget = $ccm_first + 4
Global Const $ccm_setwindowtheme = $ccm_first + 11
Global Const $ga_parent = 1
Global Const $ga_root = 2
Global Const $ga_rootowner = 3
Global Const $sm_cxscreen = 0
Global Const $sm_cyscreen = 1
Global Const $sm_cxvscroll = 2
Global Const $sm_cyhscroll = 3
Global Const $sm_cycaption = 4
Global Const $sm_cxborder = 5
Global Const $sm_cyborder = 6
Global Const $sm_cxdlgframe = 7
Global Const $sm_cydlgframe = 8
Global Const $sm_cyvthumb = 9
Global Const $sm_cxhthumb = 10
Global Const $sm_cxicon = 11
Global Const $sm_cyicon = 12
Global Const $sm_cxcursor = 13
Global Const $sm_cycursor = 14
Global Const $sm_cymenu = 15
Global Const $sm_cxfullscreen = 16
Global Const $sm_cyfullscreen = 17
Global Const $sm_cykanjiwindow = 18
Global Const $sm_mousepresent = 19
Global Const $sm_cyvscroll = 20
Global Const $sm_cxhscroll = 21
Global Const $sm_debug = 22
Global Const $sm_swapbutton = 23
Global Const $sm_reserved1 = 24
Global Const $sm_reserved2 = 25
Global Const $sm_reserved3 = 26
Global Const $sm_reserved4 = 27
Global Const $sm_cxmin = 28
Global Const $sm_cymin = 29
Global Const $sm_cxsize = 30
Global Const $sm_cysize = 31
Global Const $sm_cxframe = 32
Global Const $sm_cyframe = 33
Global Const $sm_cxmintrack = 34
Global Const $sm_cymintrack = 35
Global Const $sm_cxdoubleclk = 36
Global Const $sm_cydoubleclk = 37
Global Const $sm_cxiconspacing = 38
Global Const $sm_cyiconspacing = 39
Global Const $sm_menudropalignment = 40
Global Const $sm_penwindows = 41
Global Const $sm_dbcsenabled = 42
Global Const $sm_cmousebuttons = 43
Global Const $sm_secure = 44
Global Const $sm_cxedge = 45
Global Const $sm_cyedge = 46
Global Const $sm_cxminspacing = 47
Global Const $sm_cyminspacing = 48
Global Const $sm_cxsmicon = 49
Global Const $sm_cysmicon = 50
Global Const $sm_cysmcaption = 51
Global Const $sm_cxsmsize = 52
Global Const $sm_cysmsize = 53
Global Const $sm_cxmenusize = 54
Global Const $sm_cymenusize = 55
Global Const $sm_arrange = 56
Global Const $sm_cxminimized = 57
Global Const $sm_cyminimized = 58
Global Const $sm_cxmaxtrack = 59
Global Const $sm_cymaxtrack = 60
Global Const $sm_cxmaximized = 61
Global Const $sm_cymaximized = 62
Global Const $sm_network = 63
Global Const $sm_cleanboot = 67
Global Const $sm_cxdrag = 68
Global Const $sm_cydrag = 69
Global Const $sm_showsounds = 70
Global Const $sm_cxmenucheck = 71
Global Const $sm_cymenucheck = 72
Global Const $sm_slowmachine = 73
Global Const $sm_mideastenabled = 74
Global Const $sm_mousewheelpresent = 75
Global Const $sm_xvirtualscreen = 76
Global Const $sm_yvirtualscreen = 77
Global Const $sm_cxvirtualscreen = 78
Global Const $sm_cyvirtualscreen = 79
Global Const $sm_cmonitors = 80
Global Const $sm_samedisplayformat = 81
Global Const $sm_immenabled = 82
Global Const $sm_cxfocusborder = 83
Global Const $sm_cyfocusborder = 84
Global Const $sm_tabletpc = 86
Global Const $sm_mediacenter = 87
Global Const $sm_starter = 88
Global Const $sm_serverr2 = 89
Global Const $sm_cmetrics = 90
Global Const $sm_remotesession = 4096
Global Const $sm_shuttingdown = 8192
Global Const $sm_remotecontrol = 8193
Global Const $sm_caretblinkingenabled = 8194
Global Const $blackness = 66
Global Const $captureblt = 1073741824
Global Const $dstinvert = 5570569
Global Const $mergecopy = 12583114
Global Const $mergepaint = 12255782
Global Const $nomirrorbitmap = --2147483648
Global Const $notsrccopy = 3342344
Global Const $notsrcerase = 1114278
Global Const $patcopy = 15728673
Global Const $patinvert = 5898313
Global Const $patpaint = 16452105
Global Const $srcand = 8913094
Global Const $srccopy = 13369376
Global Const $srcerase = 4457256
Global Const $srcinvert = 6684742
Global Const $srcpaint = 15597702
Global Const $whiteness = 16711778
Global Const $dt_bottom = 8
Global Const $dt_calcrect = 1024
Global Const $dt_center = 1
Global Const $dt_editcontrol = 8192
Global Const $dt_end_ellipsis = 32768
Global Const $dt_expandtabs = 64
Global Const $dt_externalleading = 512
Global Const $dt_hideprefix = 1048576
Global Const $dt_internal = 4096
Global Const $dt_left = 0
Global Const $dt_modifystring = 65536
Global Const $dt_noclip = 256
Global Const $dt_nofullwidthcharbreak = 524288
Global Const $dt_noprefix = 2048
Global Const $dt_path_ellipsis = 16384
Global Const $dt_prefixonly = 2097152
Global Const $dt_right = 2
Global Const $dt_rtlreading = 131072
Global Const $dt_singleline = 32
Global Const $dt_tabstop = 128
Global Const $dt_top = 0
Global Const $dt_vcenter = 4
Global Const $dt_wordbreak = 16
Global Const $dt_word_ellipsis = 262144
Global Const $rdw_erase = 4
Global Const $rdw_frame = 1024
Global Const $rdw_internalpaint = 2
Global Const $rdw_invalidate = 1
Global Const $rdw_noerase = 32
Global Const $rdw_noframe = 2048
Global Const $rdw_nointernalpaint = 16
Global Const $rdw_validate = 8
Global Const $rdw_erasenow = 512
Global Const $rdw_updatenow = 256
Global Const $rdw_allchildren = 128
Global Const $rdw_nochildren = 64
Global Const $wm_renderformat = 773
Global Const $wm_renderallformats = 774
Global Const $wm_destroyclipboard = 775
Global Const $wm_drawclipboard = 776
Global Const $wm_paintclipboard = 777
Global Const $wm_vscrollclipboard = 778
Global Const $wm_sizeclipboard = 779
Global Const $wm_askcbformatname = 780
Global Const $wm_changecbchain = 781
Global Const $wm_hscrollclipboard = 782
Global Const $hterror = -2
Global Const $httransparent = -1
Global Const $htnowhere = 0
Global Const $htclient = 1
Global Const $htcaption = 2
Global Const $htsysmenu = 3
Global Const $htgrowbox = 4
Global Const $htsize = $htgrowbox
Global Const $htmenu = 5
Global Const $hthscroll = 6
Global Const $htvscroll = 7
Global Const $htminbutton = 8
Global Const $htmaxbutton = 9
Global Const $htleft = 10
Global Const $htright = 11
Global Const $httop = 12
Global Const $httopleft = 13
Global Const $httopright = 14
Global Const $htbottom = 15
Global Const $htbottomleft = 16
Global Const $htbottomright = 17
Global Const $htborder = 18
Global Const $htreduce = $htminbutton
Global Const $htzoom = $htmaxbutton
Global Const $htsizefirst = $htleft
Global Const $htsizelast = $htbottomright
Global Const $htobject = 19
Global Const $htclose = 20
Global Const $hthelp = 21
Global Const $color_scrollbar = 0
Global Const $color_background = 1
Global Const $color_activecaption = 2
Global Const $color_inactivecaption = 3
Global Const $color_menu = 4
Global Const $color_window = 5
Global Const $color_windowframe = 6
Global Const $color_menutext = 7
Global Const $color_windowtext = 8
Global Const $color_captiontext = 9
Global Const $color_activeborder = 10
Global Const $color_inactiveborder = 11
Global Const $color_appworkspace = 12
Global Const $color_highlight = 13
Global Const $color_highlighttext = 14
Global Const $color_btnface = 15
Global Const $color_btnshadow = 16
Global Const $color_graytext = 17
Global Const $color_btntext = 18
Global Const $color_inactivecaptiontext = 19
Global Const $color_btnhighlight = 20
Global Const $color_3ddkshadow = 21
Global Const $color_3dlight = 22
Global Const $color_infotext = 23
Global Const $color_infobk = 24
Global Const $color_hotlight = 26
Global Const $color_gradientactivecaption = 27
Global Const $color_gradientinactivecaption = 28
Global Const $color_menuhilight = 29
Global Const $color_menubar = 30
Global Const $color_desktop = 1
Global Const $color_3dface = 15
Global Const $color_3dshadow = 16
Global Const $color_3dhighlight = 20
Global Const $color_3dhilight = 20
Global Const $color_btnhilight = 20
Global Const $hinst_commctrl = -1
Global Const $idb_std_small_color = 0
Global Const $idb_std_large_color = 1
Global Const $idb_view_small_color = 4
Global Const $idb_view_large_color = 5
Global Const $idb_hist_small_color = 8
Global Const $idb_hist_large_color = 9
Global Const $startf_forceofffeedback = 128
Global Const $startf_forceonfeedback = 64
Global Const $startf_preventpinning = 8192
Global Const $startf_runfullscreen = 32
Global Const $startf_titleisappid = 4096
Global Const $startf_titleislinkname = 2048
Global Const $startf_usecountchars = 8
Global Const $startf_usefillattribute = 16
Global Const $startf_usehotkey = 512
Global Const $startf_useposition = 4
Global Const $startf_useshowwindow = 1
Global Const $startf_usesize = 2
Global Const $startf_usestdhandles = 256
Global Const $cdds_prepaint = 1
Global Const $cdds_postpaint = 2
Global Const $cdds_preerase = 3
Global Const $cdds_posterase = 4
Global Const $cdds_item = 65536
Global Const $cdds_itemprepaint = 65537
Global Const $cdds_itempostpaint = 65538
Global Const $cdds_itempreerase = 65539
Global Const $cdds_itemposterase = 65540
Global Const $cdds_subitem = 131072
Global Const $cdis_selected = 1
Global Const $cdis_grayed = 2
Global Const $cdis_disabled = 4
Global Const $cdis_checked = 8
Global Const $cdis_focus = 16
Global Const $cdis_default = 32
Global Const $cdis_hot = 64
Global Const $cdis_marked = 128
Global Const $cdis_indeterminate = 256
Global Const $cdis_showkeyboardcues = 512
Global Const $cdis_nearhot = 1024
Global Const $cdis_othersidehot = 2048
Global Const $cdis_drophilited = 4096
Global Const $cdrf_dodefault = 0
Global Const $cdrf_newfont = 2
Global Const $cdrf_skipdefault = 4
Global Const $cdrf_notifypostpaint = 16
Global Const $cdrf_notifyitemdraw = 32
Global Const $cdrf_notifysubitemdraw = 32
Global Const $cdrf_notifyposterase = 64
Global Const $cdrf_doerase = 8
Global Const $cdrf_skippostpaint = 256
Global Const $gui_ss_default_gui = BitOR($ws_minimizebox, $ws_caption, $ws_popup, $ws_sysmenu)
Global $search_check, $z, $tenmap
$b = 0
$c = 0

GUICreate("BMN", 165, 86, 1100, 0)
GUICtrlCreateLabel("" & @CRLF & "- Huong Dan:" & @CRLF & " + Mo 3cuaso truoc roi vao auto" & @CRLF & " + Cuaso1 chinh, Cuaso2 - 3 phu" & @CRLF & " + 3 cuaso vào chung 1TD bat ky" & @CRLF & "- F1 chay Auto", 0, 0)
GUICtrlSetFont(1, 0, 0, 0, "Tahoma")
GUICtrlSetColor(-1, 14409436)
GUICtrlSetBkColor(-1, 0)
$pause = 0
GUISetState()
MsgBox(10, "Kich Hoat Hack Thanh Cong", "")
Opt("Pixelcoordmode", 0)
ToolTip("Manh Nghia - [F1] Run - [F9] Stop - [F11] Exit", 0, 0)
$pause = 0
While 1
	HotKeySet("{F1}", "aa")
	HotKeySet("{F9}", "ActivePauseAuto")
	HotKeySet("{F11}", "ExitAuto")
	Sleep(1)
	If WinExists("cuaso1", "") = 0 Then
		WinSetTitle("Boom", "", "cuaso1")
	ElseIf WinExists("cuaso2", "") = 0 Then
		WinSetTitle("Boom", "", "cuaso2")
	ElseIf WinExists("cuaso3", "") = 0 Then
		WinSetTitle("Boom", "", "cuaso3")
	ElseIf WinExists("cuaso4", "") = 0 Then
		WinSetTitle("Boom", "", "cuaso4")
	ElseIf WinExists("cuaso5", "") = 0 Then
		WinSetTitle("Boom", "", "cuaso5")
	ElseIf WinExists("cuaso6", "") = 0 Then
		WinSetTitle("Boom", "", "cuaso6")
	ElseIf WinExists("cuaso7", "") = 0 Then
		WinSetTitle("Boom", "", "cuaso7")
	ElseIf WinExists("cuaso8", "") = 0 Then
		WinSetTitle("Boom", "", "cuaso8")
	EndIf
WEnd
ToolTip("Stoped - [F9] Continue - [F11] Exit", 0, 0)

Func getrealkey($a)
	If $a = "A" Then
		$tenmap = "Ladder02"
	ElseIf $a = "B" Then
		$tenmap = "Patrit14"
	ElseIf $a = "C" Then
		$tenmap = "Ladder01"
	ElseIf $a = "D" Then
		$tenmap = "Camp08"
	ElseIf $a = "E" Then
		$tenmap = "Ladder04"
	ElseIf $a = "F" Then
		$tenmap = "Ladder03"
	ElseIf $a = "G" Then
		$tenmap = "Ladder05"
	ElseIf $a = "H" Then
		$tenmap = "Village10"
	EndIf
	$z = $tenmap
	Return $z
EndFunc

Func aa()
	$form1 = GUICreate("Auto Win BMN2312", 200, 87, -1, -1, -1, BitOR($ws_ex_toolwindow, $ws_ex_windowedge))
	GUISetBkColor(900000000000)
	$group1 = GUICtrlCreateGroup("", 8, 0, 185, 49)
	GUICtrlSetFont(-1, 12, 800, 0, "Times New Roman")
	GUICtrlSetColor(-1, 16711680)
	$label1 = GUICtrlCreateLabel("Boom 2016", 1, 5, 0, 1)
	GUICtrlSetColor(-1, 16711680)
	GUICtrlSetFont(-1, 12, 800, 0, "Times New Roman")
	$label2 = GUICtrlCreateLabel("Doi Map Khi Gap Boss", 32, 24, 160, 23)
	GUICtrlSetColor(-1, 16777215)
	GUICtrlSetFont(-1, 12, 800, 0, "Times New Roman")
	$search_check = GUICtrlCreateCheckbox("Checkbox1", 10, 24, 17, 17)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	$button1 = GUICtrlCreateButton("Bat Dau", 8, 56, 185, 25)
	GUICtrlSetFont(-1, 13, 800, 0, "Tahoma")
	GUICtrlSetColor(-1, 16711680)
	GUICtrlSetBkColor(-1, 900000000000)
	GUISetState(@SW_SHOW)
	While 1
		$nmsg = GUIGetMsg()
		Switch $nmsg
			Case $gui_event_close
				Exit
			Case $button1
				chayf()
			Case $search_check
				MsgBox($mb_systemmodal, "Notes", "Bo nhan~ tranh bi loi")
		EndSwitch
	WEnd
EndFunc

Func chayf()
	If WinExists("cuaso1") = 0 OR WinExists("cuaso2") = 0 OR WinExists("cuaso3") = 0 Then
		MsgBox($mb_systemmodal, "Error", "Khong du 3 cuaso")
	Else
		WinActivate("cuaso1")
		WinActivate("cuaso2")
		WinActivate("cuaso3")
		WinMove("cuaso1", "", 0, 0)
		WinMove("cuaso2", "", 168, 0)
		WinMove("cuaso3", "", 168, 0)
		Global $b = WinGetPos("cuaso2"), $a = WinGetPos("cuaso1"), $hd1 = WinGetHandle("cuaso1"), $hd2 = WinGetHandle("cuaso2"), $hd3 = WinGetHandle("cuaso3"), $hd4 = WinGetHandle("cuaso4")
		$px = $a[3] - 625
		WinActivate("cuaso1")
		$a = InputBox("Notes", "Dien ten nick chinh (ten nick o cuaso1) vao khung duoi")
		WinActivate("cuaso2")
		ClipPut($a)
		ClipPut("/Who" & " " & $a)
		ControlSend("cuaso2", "", "", "{f9}")
		While PixelGetColor(280, 203 + $px, $hd2) <> 159685
		WEnd
		ControlClick("cuaso2", "", "", "left", 1, 483 - 3, 395 - 22)
		ControlClick("cuaso2", "", "", "left", 1, 483 - 3, 395 - 22)
		ControlClick("cuaso2", "", "", "left", 1, 483 - 3, 395 - 22)
		Send("^v{enter 2}")
		ControlSend("cuaso2", "", "", "{enter 2}")
		WinActivate("cuaso3")
		ClipPut($a)
		ClipPut("/Who" & " " & $a)
		ControlSend("cuaso3", "", "", "{f9}")
		While PixelGetColor(280, 203 + $px, $hd3) <> 159685
		WEnd
		ControlClick("cuaso3", "", "", "left", 1, 483 - 3, 395 - 22)
		ControlClick("cuaso3", "", "", "left", 1, 483 - 3, 395 - 22)
		ControlClick("cuaso3", "", "", "left", 1, 483 - 3, 395 - 22)
		Send("^v{enter 2}")
		ControlSend("cuaso3", "", "", "{enter 2}")
		WinActivate("cuaso1")
		ClipPut("Auto Win BMN")
		ControlSend("cuaso1", "", "", "{f9}")
		While PixelGetColor(542, 148 + $px, $hd1) <> 843775
		WEnd
		ControlClick("cuaso1", "", "", "left", 1, 385 - 3, 420 - 22)
		Send("^v{enter 2}")
		ControlClick("cuaso1", "", "", "left", 1, 408 - 3, 494 - 22)
		WinActivate("cuaso2")
		ControlClick("cuaso2", "", "", "left", 1, 385 - 3, 420 - 22)
		Send("^v{enter 2}")
		ControlClick("cuaso2", "", "", "left", 1, 408 - 3, 494 - 22)
		WinActivate("cuaso3")
		ControlClick("cuaso3", "", "", "left", 1, 385 - 3, 420 - 22)
		Send("^v{enter 2}")
		ControlClick("cuaso3", "", "", "left", 1, 408 - 3, 494 - 22)
		WinActivate("cuaso3")
		WinActivate("cuaso2")
		WinActivate("cuaso1")
;~ 		WinSetState("cuaso3", "", @SW_MINIMIZE)
		WinActivate("cuaso2")
		WinActivate("cuaso1")
		Global $b = WinGetPos("cuaso2"), $a = WinGetPos("cuaso1"), $hd1 = WinGetHandle("cuaso1"), $hd2 = WinGetHandle("cuaso2"), $hd3 = WinGetHandle("cuaso3"), $hd4 = WinGetHandle("cuaso4")
		$px = $a[3] - 625
		While 1
			MouseMove(1128, 15, 1)
			$key = StringLeft(Hex(DriveGetSerial("C:\"), 8), 6)
			ControlClick("cuaso3", "", "", "left", 1, 120 - 3, 608 - 22)
			ControlClick("cuaso1", "", "", "left", 1, 312 - 3, 65 - 22)
			ControlClick("cuaso1", "", "", "left", 1, 312 - 3, 65 - 22)
			ControlSend("cuaso1", "", "", "{enter}")
			ControlClick("cuaso1", "", "", "left", 1, 312 - 3, 65 - 22)
			ControlSend("cuaso1", "", "", "{enter}")
			ControlClick("cuaso1", "", "", "left", 1, 312 - 3, 65 - 22)
			ControlSend("cuaso1", "", "", "{enter}")
			ControlClick("cuaso1", "", "", "left", 1, 312 - 3, 65 - 22)
			ControlSend("cuaso1", "", "", "{enter}")
			While 1
				$69 = Random(65, 73, 1)
				$a = Chr($69)
				Global $searchmap = getrealkey($a)
				If GUICtrlRead($search_check) = $gui_checked Then
					RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\MPLAY\CRAZY ARCADE", "LastSelectedDynamicMapIdx", "REG_SZ", $searchmap)
				EndIf
				ControlClick("cuaso2", "", "", "left", 1, 312 - 3, 65 + 0)
				While 1
					ControlClick("cuaso1", "", "", "left", 1, 312 - 3, 65 + 0)
					ControlSend("cuaso1", "", "", "{enter}")
					ControlSend("cuaso2", "", "", "{enter}")
					If PixelGetColor(766, 318 + $px, $hd1) = 10618408 AND PixelGetColor(766, 318 + $px, $hd1) = 10618408 Then
						ControlSend("cuaso2", "", "", "{f5 2}")
						ControlSend("cuaso2", "", "", "{f5 2}")
						ControlSend("cuaso1", "", "", "{f5 2}")
						ControlSend("cuaso2", "", "", "{f5 2}")
						ControlSend("cuaso1", "", "", "{f5 2}")
						WinActivate("cuaso2")
						WinActivate("cuaso1")
						ControlSend("cuaso2", "", "", "{f5 2}")
						ControlSend("cuaso1", "", "", "{f5 2}")
						ControlSend("cuaso2", "", "", "{f5 2}")
						ExitLoop
					EndIf
				WEnd
				While 1
					If PixelGetColor(354, 351 + $px, $hd1) = 4576500 Then
						$css = False
						ExitLoop
					ElseIf PixelGetColor(644, 521 + $px, $hd1) = 28580 OR PixelGetColor(644, 521 + $px, $hd2) = 28580 Then
						While 1
							If (PixelGetColor(793, 527 + $px, $hd2) = 41711 AND PixelGetColor(793, 527 + $px, $hd1) = 41711) OR (PixelGetColor(793, 527 + $px, $hd1) = 28580 AND PixelGetColor(793, 527 + $px, $hd2) = 28580) Then
								If PixelGetColor(719, 130 + $px, $hd1) = PixelGetColor(719, 130 + $px, $hd2) AND PixelGetColor(719, 137 + $px, $hd1) = PixelGetColor(719, 137 + $px, $hd2) AND PixelGetColor(717, 135 + $px, $hd1) = PixelGetColor(717, 135 + $px, $hd2) AND PixelGetColor(721, 135 + $px, $hd1) = PixelGetColor(721, 135 + $px, $hd2) AND PixelGetColor(719, 171 + $px, $hd1) = PixelGetColor(719, 171 + $px, $hd2) AND PixelGetColor(719, 180 + $px, $hd1) = PixelGetColor(719, 180 + $px, $hd2) AND PixelGetColor(717, 178 + $px, $hd1) = PixelGetColor(717, 178 + $px, $hd2) AND PixelGetColor(721, 178 + $px, $hd1) = PixelGetColor(721, 178 + $px, $hd2) AND PixelGetColor(719, 214 + $px, $hd1) = PixelGetColor(719, 214 + $px, $hd2) AND PixelGetColor(719, 223 + $px, $hd1) = PixelGetColor(719, 223 + $px, $hd2) AND PixelGetColor(717, 220 + $px, $hd1) = PixelGetColor(717, 220 + $px, $hd2) AND PixelGetColor(721, 220 + $px, $hd1) = PixelGetColor(721, 220 + $px, $hd2) AND PixelGetColor(719, 256 + $px, $hd1) = PixelGetColor(719, 256 + $px, $hd2) AND PixelGetColor(719, 265 + $px, $hd1) = PixelGetColor(719, 265 + $px, $hd2) AND PixelGetColor(717, 260 + $px, $hd1) = PixelGetColor(717, 260 + $px, $hd2) AND PixelGetColor(721, 260 + $px, $hd1) = PixelGetColor(721, 260 + $px, $hd2) AND PixelGetColor(685, 153 + $px, $hd1) = PixelGetColor(685, 153 + $px, $hd2) AND PixelGetColor(685, 196 + $px, $hd1) = PixelGetColor(685, 196 + $px, $hd2) AND PixelGetColor(685, 239 + $px, $hd1) = PixelGetColor(685, 239 + $px, $hd2) AND PixelGetColor(685, 282 + $px, $hd1) = PixelGetColor(685, 282 + $px, $hd2) AND PixelGetColor(674, 137 + $px, $hd1) = PixelGetColor(674, 137 + $px, $hd2) AND PixelGetColor(674, 180 + $px, $hd1) = PixelGetColor(674, 180 + $px, $hd2) AND PixelGetColor(674, 223 + $px, $hd1) = PixelGetColor(674, 223 + $px, $hd2) AND PixelGetColor(674, 266 + $px, $hd1) = PixelGetColor(674, 266 + $px, $hd2) AND PixelGetColor(696, 137 + $px, $hd1) = PixelGetColor(696, 137 + $px, $hd2) AND PixelGetColor(696, 180 + $px, $hd1) = PixelGetColor(696, 180 + $px, $hd2) AND PixelGetColor(696, 223 + $px, $hd1) = PixelGetColor(696, 223 + $px, $hd2) AND PixelGetColor(696, 266 + $px, $hd1) = PixelGetColor(696, 266 + $px, $hd2) Then
									$css = True
								Else
									$css = False
								EndIf
								ExitLoop
							ElseIf PixelGetColor(789, 35 + $px, $hd2) = 289992 OR PixelGetColor(789, 35 + $px, $hd1) = 289992 Then
								$css = False
								ExitLoop
							EndIf
						WEnd
						ExitLoop
					EndIf
				WEnd
				ControlSend("cuaso3", "", "", "{right down}")
				ControlSend("cuaso3", "", "", "{right down}")
				ControlSend("cuaso3", "", "", "{right down}")
				ControlSend("cuaso3", "", "", "{right down}")
				ControlSend("cuaso3", "", "", "{right down}")
				ControlSend("cuaso3", "", "", "{right down}")
				ControlSend("cuaso3", "", "", "{left down}")
				ControlSend("cuaso3", "", "", "{right down}")
				ControlSend("cuaso3", "", "", "{right down}")
				ControlSend("cuaso3", "", "", "{right down}")
				ControlSend("cuaso3", "", "", "{right down}")
				ControlSend("cuaso3", "", "", "{left down}")
				ControlClick("cuaso3", "", "", "left", 2, 503 - 2, 447 - 23)
				ControlSend("cuaso3", "", "", "{enter 3}")
				ControlClick("cuaso3", "", "", "left", 2, 503 - 2, 447 - 23)
				ControlSend("cuaso3", "", "", "{enter 3}")
				ControlClick("cuaso3", "", "", "left", 2, 503 - 2, 447 - 23)
				ControlClick("cuaso3", "", "", "left", 2, 503 - 2, 447 - 23)
				ControlSend("cuaso3", "", "", "{enter 3}")
				ControlClick("cuaso3", "", "", "left", 2, 503 - 2, 447 - 23)
				ControlSend("cuaso2", "", "", "{enter 3}")
				ControlClick("cuaso3", "", "", "left", 2, 503 - 2, 447 - 23)
				If $css = False Then
					ControlClick("cuaso2", "", "", "left", 1, 120 - 3, 608 - 22)
					ControlClick("cuaso1", "", "", "left", 1, 120 - 3, 608 - 22)
					ControlSend("cuaso2", "", "", "{up 20}{enter}")
					ControlSend("cuaso1", "", "", "{up 20}{enter}")
					ControlSend("cuaso2", "", "", "{up 20}{enter}")
					ControlSend("cuaso1", "", "", "{up 20}{enter}")
					ControlSend("cuaso2", "", "", "{up 20}{enter}")
					ControlSend("cuaso1", "", "", "{up 20}{enter}")
				Else
;~ 					WinSetState("cuaso2", "", @SW_MINIMIZE)
					WinActivate("cuaso3")
					ControlClick("cuaso3", "", "", "left", 1, 595 - 3, 214 - 22)
					ControlClick("cuaso3", "", "", "left", 1, 595 - 3, 214 - 22)
					ControlClick("cuaso3", "", "", "left", 1, 675 - 3, 388 - 22)
					While 1
						ControlSend("cuaso3", "", "", "!8{enter}")
						If PixelGetColor(666, 125 + $px, $hd3) = 8584202 Then
							ControlClick("cuaso3", "", "", "left", 1, 493 - 3, 273 - 22)
							ExitLoop
						EndIf
					WEnd
					While PixelGetColor(547, 221 + $px, $hd3) <> 843775
					WEnd
					ControlClick("cuaso3", "", "", "left", 1, 343 - 3, 420 - 22)
;~ 					WinSetState("cuaso3", "", @SW_MINIMIZE)
					While PixelGetColor(644, 521 + $px, $hd1) <> 41711
					WEnd
					ControlSend("cuaso3", "", "", "!{9}{enter}")
					ControlSend("cuaso3", "", "", "!{9}{enter}")
					ControlClick("cuaso3", "", "", "left", 2, 270 - 2, 57 - 23)
					ControlClick("cuaso3", "", "", "left", 2, 270 - 2, 57 - 23)
					ControlClick("cuaso3", "", "", "left", 2, 270 - 2, 57 - 23)
					ControlClick("cuaso3", "", "", "left", 2, 270 - 2, 57 - 23)
					ControlClick("cuaso3", "", "", "left", 2, 270 - 2, 57 - 23)
					ControlClick("cuaso3", "", "", "left", 2, 270 - 2, 57 - 23)
					ControlClick("cuaso3", "", "", "left", 2, 270 - 2, 57 - 23)
					ControlSend("cuaso3", "", "", "BMN2312 Post Win")
					$c1 = PixelGetColor(400, 400 + $px, $hd1)
					While PixelGetColor(400, 400 + $px, $hd1) = $c1
						ControlClick("cuaso2", "", "", "left", 1, 745 - 2, 606 - 23)
						ControlClick("cuaso3", "", "", "left", 2, 270 - 2, 57 - 23)
						ControlSend("cuaso2", "", "", "{enter}")
						ControlSend("cuaso3", "", "", "{enter}")
					WEnd
					ControlClick("cuaso1", "", "", "left", 1, 745 - 2, 606 - 23)
					ControlClick("cuaso1", "", "", "left", 1, 745 - 2, 606 - 23)
					ControlClick("cuaso1", "", "", "left", 1, 745 - 2, 606 - 23)
					ControlSend("cuaso1", "", "", "{enter 2}")
					ControlClick("cuaso1", "", "", "left", 1, 745 - 2, 606 - 23)
					ExitLoop
					ExitLoop
				EndIf
			WEnd
			ControlClick("cuaso2", "", "", "left", 1, 120 - 3, 608 - 22)
			ControlClick("cuaso1", "", "", "left", 1, 312 - 3, 65 - 22)
			ControlClick("cuaso1", "", "", "left", 1, 312 - 3, 65 - 22)
			ControlSend("cuaso1", "", "", "{enter}")
			ControlClick("cuaso1", "", "", "left", 1, 312 - 3, 65 - 22)
			ControlSend("cuaso1", "", "", "{enter}")
			ControlClick("cuaso1", "", "", "left", 1, 312 - 3, 65 - 22)
			ControlSend("cuaso1", "", "", "{enter}")
			ControlClick("cuaso1", "", "", "left", 1, 312 - 3, 65 - 22)
			ControlSend("cuaso1", "", "", "{enter}")
			ControlClick("cuaso1", "", "", "left", 1, 312 - 3, 65 - 22)
			ControlSend("cuaso1", "", "", "{enter}")
			While 1
				$69 = Random(65, 73, 1)
				$a = Chr($69)
				Global $searchmap = getrealkey($a)
				If GUICtrlRead($search_check) = $gui_checked Then
					RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\MPLAY\CRAZY ARCADE", "LastSelectedDynamicMapIdx", "REG_SZ", $searchmap)
				EndIf
				ControlClick("cuaso3", "", "", "left", 1, 310 - 3, 65 + 0)
				While 1
					ControlClick("cuaso1", "", "", "left", 1, 312 - 3, 65 + 0)
					ControlSend("cuaso1", "", "", "{enter}")
					ControlSend("cuaso3", "", "", "{enter}")
					If PixelGetColor(766, 318 + $px, $hd1) = 10618408 AND PixelGetColor(766, 318 + $px, $hd1) = 10618408 Then
						ControlSend("cuaso3", "", "", "{f5 2}")
						ControlSend("cuaso3", "", "", "{f5 2}")
						ControlSend("cuaso1", "", "", "{f5 2}")
						ControlSend("cuaso3", "", "", "{f5 2}")
						ControlSend("cuaso1", "", "", "{f5 2}")
						WinActivate("cuaso3")
						WinActivate("cuaso1")
						ControlSend("cuaso3", "", "", "{f5 2}")
						ControlSend("cuaso1", "", "", "{f5 2}")
						ControlSend("cuaso3", "", "", "{f5 2}")
						ExitLoop
					EndIf
				WEnd
				While 1
					If PixelGetColor(354, 351 + $px, $hd1) = 4576500 Then
						$css = False
						ExitLoop
					ElseIf PixelGetColor(644, 521 + $px, $hd1) = 28580 OR PixelGetColor(644, 521 + $px, $hd3) = 28580 Then
						While 1
							If (PixelGetColor(793, 527 + $px, $hd3) = 41711 AND PixelGetColor(793, 527 + $px, $hd1) = 41711) OR (PixelGetColor(793, 527 + $px, $hd1) = 28580 AND PixelGetColor(793, 527 + $px, $hd3) = 28580) Then
								If PixelGetColor(719, 130 + $px, $hd1) = PixelGetColor(719, 130 + $px, $hd3) AND PixelGetColor(719, 137 + $px, $hd1) = PixelGetColor(719, 137 + $px, $hd3) AND PixelGetColor(717, 135 + $px, $hd1) = PixelGetColor(717, 135 + $px, $hd3) AND PixelGetColor(721, 135 + $px, $hd1) = PixelGetColor(721, 135 + $px, $hd3) AND PixelGetColor(719, 171 + $px, $hd1) = PixelGetColor(719, 171 + $px, $hd3) AND PixelGetColor(719, 180 + $px, $hd1) = PixelGetColor(719, 180 + $px, $hd3) AND PixelGetColor(717, 178 + $px, $hd1) = PixelGetColor(717, 178 + $px, $hd3) AND PixelGetColor(721, 178 + $px, $hd1) = PixelGetColor(721, 178 + $px, $hd3) AND PixelGetColor(719, 214 + $px, $hd1) = PixelGetColor(719, 214 + $px, $hd3) AND PixelGetColor(719, 223 + $px, $hd1) = PixelGetColor(719, 223 + $px, $hd3) AND PixelGetColor(717, 220 + $px, $hd1) = PixelGetColor(717, 220 + $px, $hd3) AND PixelGetColor(721, 220 + $px, $hd1) = PixelGetColor(721, 220 + $px, $hd3) AND PixelGetColor(719, 256 + $px, $hd1) = PixelGetColor(719, 256 + $px, $hd3) AND PixelGetColor(719, 265 + $px, $hd1) = PixelGetColor(719, 265 + $px, $hd3) AND PixelGetColor(717, 260 + $px, $hd1) = PixelGetColor(717, 260 + $px, $hd3) AND PixelGetColor(721, 260 + $px, $hd1) = PixelGetColor(721, 260 + $px, $hd3) AND PixelGetColor(685, 153 + $px, $hd1) = PixelGetColor(685, 153 + $px, $hd3) AND PixelGetColor(685, 196 + $px, $hd1) = PixelGetColor(685, 196 + $px, $hd3) AND PixelGetColor(685, 239 + $px, $hd1) = PixelGetColor(685, 239 + $px, $hd3) AND PixelGetColor(685, 282 + $px, $hd1) = PixelGetColor(685, 282 + $px, $hd3) AND PixelGetColor(674, 137 + $px, $hd1) = PixelGetColor(674, 137 + $px, $hd3) AND PixelGetColor(674, 180 + $px, $hd1) = PixelGetColor(674, 180 + $px, $hd3) AND PixelGetColor(674, 223 + $px, $hd1) = PixelGetColor(674, 223 + $px, $hd3) AND PixelGetColor(674, 266 + $px, $hd1) = PixelGetColor(674, 266 + $px, $hd3) AND PixelGetColor(696, 137 + $px, $hd1) = PixelGetColor(696, 137 + $px, $hd3) AND PixelGetColor(696, 180 + $px, $hd1) = PixelGetColor(696, 180 + $px, $hd3) AND PixelGetColor(696, 223 + $px, $hd1) = PixelGetColor(696, 223 + $px, $hd3) AND PixelGetColor(696, 266 + $px, $hd1) = PixelGetColor(696, 266 + $px, $hd3) Then
									$css = True
								Else
									$css = False
								EndIf
								ExitLoop
							ElseIf PixelGetColor(789, 35 + $px, $hd3) = 289992 OR PixelGetColor(789, 35 + $px, $hd1) = 289992 Then
								$css = False
								ExitLoop
							EndIf
						WEnd
						ExitLoop
					EndIf
				WEnd
				ControlSend("cuaso2", "", "", "{right down}")
				ControlSend("cuaso2", "", "", "{right down}")
				ControlSend("cuaso2", "", "", "{right down}")
				ControlSend("cuaso2", "", "", "{right down}")
				ControlSend("cuaso2", "", "", "{right down}")
				ControlSend("cuaso2", "", "", "{right down}")
				ControlSend("cuaso2", "", "", "{right down}")
				ControlSend("cuaso2", "", "", "{left down}")
				ControlSend("cuaso2", "", "", "{right down}")
				ControlSend("cuaso2", "", "", "{right down}")
				ControlSend("cuaso2", "", "", "{right down}")
				ControlSend("cuaso2", "", "", "{right down}")
				ControlSend("cuaso2", "", "", "{left down}")
				ControlClick("cuaso2", "", "", "left", 2, 503 - 2, 447 - 23)
				ControlSend("cuaso2", "", "", "{enter 3}")
				ControlClick("cuaso2", "", "", "left", 2, 503 - 2, 447 - 23)
				ControlSend("cuaso2", "", "", "{enter 3}")
				ControlClick("cuaso2", "", "", "left", 2, 503 - 2, 447 - 23)
				ControlClick("cuaso2", "", "", "left", 2, 503 - 2, 447 - 23)
				ControlSend("cuaso2", "", "", "{enter 3}")
				ControlClick("cuaso2", "", "", "left", 2, 503 - 2, 447 - 23)
				ControlSend("cuaso2", "", "", "{enter 3}")
				ControlClick("cuaso2", "", "", "left", 2, 503 - 2, 447 - 23)
				If $css = False Then
					ControlClick("cuaso3", "", "", "left", 1, 120 - 3, 608 - 22)
					ControlClick("cuaso1", "", "", "left", 1, 120 - 3, 608 - 22)
					ControlSend("cuaso3", "", "", "{up 20}{enter}")
					ControlSend("cuaso1", "", "", "{up 20}{enter}")
					ControlSend("cuaso3", "", "", "{up 20}{enter}")
					ControlSend("cuaso1", "", "", "{up 20}{enter}")
					ControlSend("cuaso3", "", "", "{up 20}{enter}")
					ControlSend("cuaso1", "", "", "{up 20}{enter}")
				Else
;~ 					WinSetState("cuaso3", "", @SW_MINIMIZE)
					WinActivate("cuaso2")
					ControlClick("cuaso2", "", "", "left", 1, 595 - 3, 214 - 22)
					ControlClick("cuaso2", "", "", "left", 1, 595 - 3, 214 - 22)
					ControlClick("cuaso2", "", "", "left", 1, 675 - 3, 388 - 22)
					While 1
						ControlSend("cuaso2", "", "", "!8{enter}")
						If PixelGetColor(666, 125 + $px, $hd2) = 8584202 Then
							ControlClick("cuaso2", "", "", "left", 1, 493 - 3, 273 - 22)
							ExitLoop
						EndIf
					WEnd
					While PixelGetColor(547, 221 + $px, $hd2) <> 843775
					WEnd
					ControlClick("cuaso2", "", "", "left", 1, 343 - 3, 420 - 22)
;~ 					WinSetState("cuaso2", "", @SW_MINIMIZE)
					While PixelGetColor(644, 521 + $px, $hd1) <> 41711
					WEnd
					ControlSend("cuaso2", "", "", "!{9}{enter}")
					ControlSend("cuaso2", "", "", "!{9}{enter}")
					ControlClick("cuaso2", "", "", "left", 2, 270 - 2, 57 - 23)
					ControlClick("cuaso2", "", "", "left", 2, 270 - 2, 57 - 23)
					ControlClick("cuaso2", "", "", "left", 2, 270 - 2, 57 - 23)
					ControlClick("cuaso2", "", "", "left", 2, 270 - 2, 57 - 23)
					ControlClick("cuaso2", "", "", "left", 2, 270 - 2, 57 - 23)
					ControlClick("cuaso2", "", "", "left", 2, 270 - 2, 57 - 23)
					ControlClick("cuaso2", "", "", "left", 2, 270 - 2, 57 - 23)
					ControlSend("cuaso2", "", "", "BMN2312 Post Win")
					$c1 = PixelGetColor(400, 400 + $px, $hd1)
					While PixelGetColor(400, 400 + $px, $hd1) = $c1
						ControlClick("cuaso3", "", "", "left", 1, 745 - 2, 606 - 23)
						ControlClick("cuaso2", "", "", "left", 2, 270 - 2, 57 - 23)
						ControlSend("cuaso3", "", "", "{enter}")
						ControlSend("cuaso2", "", "", "{enter}")
					WEnd
					ControlClick("cuaso1", "", "", "left", 1, 745 - 2, 606 - 23)
					ControlClick("cuaso1", "", "", "left", 1, 745 - 2, 606 - 23)
					ControlClick("cuaso1", "", "", "left", 1, 745 - 2, 606 - 23)
					ControlSend("cuaso1", "", "", "{enter 2}")
					ControlClick("cuaso1", "", "", "left", 1, 745 - 2, 606 - 23)
					ExitLoop
				EndIf
			WEnd
		WEnd
	EndIf
EndFunc

Func activepauseauto()
	$pause = NOT $pause
	ToolTip("Running - [F1] Restart - [F9] Stop - [F11] Exit", 0, 0)
	While $pause
		ToolTip("Stoped - [F1] Restart - [F9] Continue - [F11] Exit", 0, 0)
	WEnd
EndFunc

Func exitauto()
;~ 	MsgBox(0, "GoodBye", "Chúc Các Bạn Chơi Game Vui Vẻ !!!")
	Exit
EndFunc
