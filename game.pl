:- dynamic figure/7.
:- dynamic answer/1.
:- dynamic res/1.
:- dynamic help/1.
:- dynamic difficulty/1.

difficulty(1).
help(0).

game() :- 
    show_window(),
    start().

start() :- 
    start_();
    show_game().

start_() :- 
    clear_figures();
    clear_answer();
    \+ gen_figures(),
    start_().

clear_figures() :- 
    retract(figure(_,_,_,_,_,_,_)),
    clear_figures().

clear_answer() :- 
    retract(answer(_)),
    clear_answer().

position(1,20 ,10).
position(2,100,10).
position(3,180,10).
position(4,20 ,90).
position(5,100,90).
position(6,180,90).
position(7,20 ,170).
position(8,100,170).

position(9,  20,270).
position(10,100,270).
position(11,180,270).
position(12,260,270).
position(13,340,270).
position(14,420,270).

prev_4(X,R) :- 
    X > 1, !, R is X - 1;
    R is 4. 

next_4(X,R) :- 
    X < 4, !, R is X + 1;
    R is 1. 

next_6(X,R) :- 
    X < 14, !, R is X + 1;
    R is 9. 

next_2(1,2).
next_2(2,1).

getf(C1,F1,B1,C1i,F1i,B1i,C2,F2,B2,C2i,F2i,B2i) :-
    difficulty(3),
    next_4(C1, F2),
    next_4(F1, C2i),
    prev_4(C1i, C2),
    prev_4(F1i, F2i),    
    next_2(B1i, B2i),
    next_2(B1, B2).

getf(C1,F1,B1,C1i,F1i,B1i,C2,F2,B2,C2i,F2i,B2i) :-
    difficulty(2),
    next_4(C1, F2),
    next_4(F1, C2i),
    prev_4(C1i, C2),
    F2i is F2,
    B2i is B1i,
    B2 is B1.

getf(C1,F1,B1,C1i,F1i,B1i,C2,F2,B2,C2i,F2i,B2i) :-
    difficulty(1),
    next_4(C1, F2),
    next_4(F1, C2i),
    next_2(B1, B2),
    next_4(C1i, F2i),
    next_4(F1i, C2),
    next_2(B1i, B2i).

geta(C,F,B,Ci,Fi,Bi) :-
    gen_figure(C,F,B,Ci,Fi,Bi),
    not(figure(_,C,F,B,Ci,Fi,Bi)).

gen_figure(C,F,B,Ci,Fi,Bi) :-
    random(1,5,C),
    random(1,5,F),
    random(1,3,B), 
    random(1,5,Ci),
    random(1,5,Fi),
    random(1,3,Bi).   

gen_figures() :- 
    gen_figure(F1_C,F1_F,F1_B,F1_Ci,F1_Fi,F1_Bi),

    getf(F1_C,F1_F,F1_B,F1_Ci,F1_Fi,F1_Bi,F2_C,F2_F,F2_B,F2_Ci,F2_Fi,F2_Bi),
    getf(F2_C,F2_F,F2_B,F2_Ci,F2_Fi,F2_Bi,F3_C,F3_F,F3_B,F3_Ci,F3_Fi,F3_Bi),
    getf(F3_C,F3_F,F3_B,F3_Ci,F3_Fi,F3_Bi,F4_C,F4_F,F4_B,F4_Ci,F4_Fi,F4_Bi),
    getf(F4_C,F4_F,F4_B,F4_Ci,F4_Fi,F4_Bi,F5_C,F5_F,F5_B,F5_Ci,F5_Fi,F5_Bi),
    getf(F5_C,F5_F,F5_B,F5_Ci,F5_Fi,F5_Bi,F6_C,F6_F,F6_B,F6_Ci,F6_Fi,F6_Bi),
    getf(F6_C,F6_F,F6_B,F6_Ci,F6_Fi,F6_Bi,F7_C,F7_F,F7_B,F7_Ci,F7_Fi,F7_Bi),
    getf(F7_C,F7_F,F7_B,F7_Ci,F7_Fi,F7_Bi,F8_C,F8_F,F8_B,F8_Ci,F8_Fi,F8_Bi),
    getf(F8_C,F8_F,F8_B,F8_Ci,F8_Fi,F8_Bi,F9_C,F9_F,F9_B,F9_Ci,F9_Fi,F9_Bi),

    assertz(figure(1,F1_C,F1_F,F1_B,F1_Ci,F1_Fi,F1_Bi)),
    assertz(figure(2,F2_C,F2_F,F2_B,F2_Ci,F2_Fi,F2_Bi)),
    assertz(figure(3,F3_C,F3_F,F3_B,F3_Ci,F3_Fi,F3_Bi)),
    assertz(figure(4,F4_C,F4_F,F4_B,F4_Ci,F4_Fi,F4_Bi)),
    assertz(figure(5,F5_C,F5_F,F5_B,F5_Ci,F5_Fi,F5_Bi)),
    assertz(figure(6,F6_C,F6_F,F6_B,F6_Ci,F6_Fi,F6_Bi)),
    assertz(figure(7,F7_C,F7_F,F7_B,F7_Ci,F7_Fi,F7_Bi)),
    assertz(figure(8,F8_C,F8_F,F8_B,F8_Ci,F8_Fi,F8_Bi)),

    random(9,15,F9_p),
    Answer is F9_p - 8,
    atom_string(Answer,Answer_1),
    assertz(answer(Answer_1)),
    assertz(figure(F9_p ,F9_C,F9_F,F9_B,F9_Ci,F9_Fi,F9_Bi)),

    next_6(F9_p ,F10_p),
    next_6(F10_p,F11_p),
    next_6(F11_p,F12_p),
    next_6(F12_p,F13_p),
    next_6(F13_p,F14_p),

    gen_answers(F9_p,F10_p,F11_p,F12_p,F13_p,F14_p).

gen_answers(F9_p,F10_p,F11_p,F12_p,F13_p,F14_p) :- 

    figure(F9_p,AnsC,AnsF,AnsB,AnsCi,AnsFi,AnsBi),

    next_4(AnsC,F10_C),
    next_4(AnsF,F11_F),
    next_2(AnsB,F12_B),
    next_4(AnsCi,F13_Ci),
    next_4(AnsFi,F14_Fi),

    assertz(figure(F10_p,F10_C,AnsF,AnsB,AnsCi,AnsFi,AnsBi)),
    assertz(figure(F11_p,AnsC,F11_F,AnsB,AnsCi,F14_Fi,AnsBi)),
    assertz(figure(F12_p,AnsC,AnsF,F12_B,AnsCi,AnsFi,AnsBi)),
    assertz(figure(F13_p,AnsC,AnsF,AnsB,F13_Ci,AnsFi,AnsBi)),
    assertz(figure(F14_p,F10_C,AnsF,AnsB,AnsCi,F14_Fi,AnsBi)).

show_figures() :-
    show_figure(1);
    true.

fname(Begin,End,C,F,B,Res) :-
    atom_string(C,Cs),
    atom_string(F,Fs),
    atom_string(B,Bs),
    atom_concat(Begin,Cs,R1),
    atom_concat(R1,"_",R2),
    atom_concat(R2,Fs,R3),
    atom_concat(R3,"_",R4),
    atom_concat(R4,Bs,R5),
    atom_concat(R5,End,Res).

show_figure(N) :-
    position(N,X,Y),
    figure(N,C,F,B,Ci,Fi,Bi),

    fname("img/f_",".jpg",C,F,B,Fname_f),
    fname("img/i_",".xpm",Ci,Fi,Bi,Fname_i),

    display_figure(N,X,Y,Fname_f),
    display_inform(N,X,Y,Fname_i),
    New_N is N + 1,
    show_figure(New_N).

display_figure(1 ,X,Y,Fname) :- send(@d, display, new(@f_1 , bitmap(Fname)), point(X,Y)).
display_figure(2 ,X,Y,Fname) :- send(@d, display, new(@f_2 , bitmap(Fname)), point(X,Y)).
display_figure(3 ,X,Y,Fname) :- send(@d, display, new(@f_3 , bitmap(Fname)), point(X,Y)).
display_figure(4 ,X,Y,Fname) :- send(@d, display, new(@f_4 , bitmap(Fname)), point(X,Y)).
display_figure(5 ,X,Y,Fname) :- send(@d, display, new(@f_5 , bitmap(Fname)), point(X,Y)).
display_figure(6 ,X,Y,Fname) :- send(@d, display, new(@f_6 , bitmap(Fname)), point(X,Y)).
display_figure(7 ,X,Y,Fname) :- send(@d, display, new(@f_7 , bitmap(Fname)), point(X,Y)).
display_figure(8 ,X,Y,Fname) :- send(@d, display, new(@f_8 , bitmap(Fname)), point(X,Y)).
display_figure(9 ,X,Y,Fname) :- send(@d, display, new(@f_9 , bitmap(Fname)), point(X,Y)).
display_figure(10,X,Y,Fname) :- send(@d, display, new(@f_10, bitmap(Fname)), point(X,Y)).
display_figure(11,X,Y,Fname) :- send(@d, display, new(@f_11, bitmap(Fname)), point(X,Y)).
display_figure(12,X,Y,Fname) :- send(@d, display, new(@f_12, bitmap(Fname)), point(X,Y)).
display_figure(13,X,Y,Fname) :- send(@d, display, new(@f_13, bitmap(Fname)), point(X,Y)).
display_figure(14,X,Y,Fname) :- send(@d, display, new(@f_14, bitmap(Fname)), point(X,Y)).

display_inform(1 ,X,Y,Fname) :- send(@d, display, new(@i_1 , bitmap(Fname)), point(X,Y)).
display_inform(2 ,X,Y,Fname) :- send(@d, display, new(@i_2 , bitmap(Fname)), point(X,Y)).
display_inform(3 ,X,Y,Fname) :- send(@d, display, new(@i_3 , bitmap(Fname)), point(X,Y)).
display_inform(4 ,X,Y,Fname) :- send(@d, display, new(@i_4 , bitmap(Fname)), point(X,Y)).
display_inform(5 ,X,Y,Fname) :- send(@d, display, new(@i_5 , bitmap(Fname)), point(X,Y)).
display_inform(6 ,X,Y,Fname) :- send(@d, display, new(@i_6 , bitmap(Fname)), point(X,Y)).
display_inform(7 ,X,Y,Fname) :- send(@d, display, new(@i_7 , bitmap(Fname)), point(X,Y)).
display_inform(8 ,X,Y,Fname) :- send(@d, display, new(@i_8 , bitmap(Fname)), point(X,Y)).
display_inform(9 ,X,Y,Fname) :- send(@d, display, new(@i_9 , bitmap(Fname)), point(X,Y)).
display_inform(10,X,Y,Fname) :- send(@d, display, new(@i_10, bitmap(Fname)), point(X,Y)).
display_inform(11,X,Y,Fname) :- send(@d, display, new(@i_11, bitmap(Fname)), point(X,Y)).
display_inform(12,X,Y,Fname) :- send(@d, display, new(@i_12, bitmap(Fname)), point(X,Y)).
display_inform(13,X,Y,Fname) :- send(@d, display, new(@i_13, bitmap(Fname)), point(X,Y)).
display_inform(14,X,Y,Fname) :- send(@d, display, new(@i_14, bitmap(Fname)), point(X,Y)).

show_window() :- 
    new(@d,dialog('game')),

    send(@d, append, new(@window,box(510,410))),
    send(@window, fill_pattern, colour(white)),    
    send(@d, open),

	send(@d, display, new(@diff , bitmap("img/diff.jpg")), point(335,20)),
    send(@d, display, button(1, message(@d, return, 'Q')), point(320,50)),
    send(@d, display, button(2, message(@d, return, 'W')), point(320,80)),
    send(@d, display, button(3, message(@d, return, 'E')), point(320,110)),
    send(@d, display, new(@diff_l , bitmap("img/n_1.jpg")), point(405,75)),

    send(@d, display, new(@UA, text_item(answer)), point(260,170)),
    send(@d, display, button(enter,  message(@d, return, @UA?selection)), point(320,200)),
    send(@d, display, button(change, message(@d, return, 'X')), point(420,200)),
    send(@d, display, button(help, message(@d, return, 'H')), point(370,230)),
    send(@d, default_button, enter),

    send(@d, display, new(@f_x, bitmap('img/x.jpg')), point(180,170)),    
    send(@d, display, new(@n_1, bitmap("img/n_1.jpg")), point( 20,340)),
    send(@d, display, new(@n_2, bitmap("img/n_2.jpg")), point(100,340)),
    send(@d, display, new(@n_3, bitmap("img/n_3.jpg")), point(180,340)),
    send(@d, display, new(@n_4, bitmap("img/n_4.jpg")), point(260,340)),
    send(@d, display, new(@n_5, bitmap("img/n_5.jpg")), point(340,340)),
    send(@d, display, new(@n_6, bitmap("img/n_6.jpg")), point(420,340)).

show_game() :-
    show_figures(),
    get(@d, confirm, Answer),
    delele_res(),
    check_answer(Answer).

check_answer('X') :- !, change().
check_answer('Q') :- !, change_diff(1), change().
check_answer('W') :- !, change_diff(2), change().
check_answer('E') :- !, change_diff(3), change().
check_answer('H') :- !, show_help(), get(@d, confirm, Answer), check_answer(Answer).
check_answer(UA) :- 
    atom_string(UA,A),
    process(A),
    get(@d, confirm, Answer),
    delele_res(),
    check_answer(Answer).

show_help() :- help(1).

help_pos_num(1, 20,270).
help_pos_num(2,100,270).
help_pos_num(3,180,270).
help_pos_num(4,260,270).
help_pos_num(5,340,270).
help_pos_num(6,420,270).

gen_help_1(Ans,H1) :- 
    atom_string(Ans,A),
    random(1,7,H1),
    atom_string(H1,H1s),
    H1s \= A;
    gen_help_1(Ans,H1).

gen_help_2(Ans,H1,H2) :- 
    atom_string(Ans,A),
    atom_string(H1,H1s),
    random(1,7,H2),
    atom_string(H2,H2s),
    H2s \= A, H2s \= H1s;
    gen_help_2(Ans,H1,H2).

gen_help_3(Ans,H1,H2,H3) :- 
    atom_string(Ans,A),
    atom_string(H1,H1s),
    atom_string(H2,H2s),
    random(1,7,H3),
    atom_string(H3,H3s),
    H3s \= A, H3s \= H1s, H3s \= H2s;
    gen_help_3(Ans,H1,H2,H3).

show_help() :- 
    help(0),
    retract(help(0)),
    assertz(help(1)),

    answer(X),
    gen_help_1(X,H1),
    gen_help_2(X,H1,H2),
    gen_help_3(X,H1,H2,H3),

    help_pos_num(H1,H1X,H1Y),
    help_pos_num(H2,H2X,H2Y),
    help_pos_num(H3,H3X,H3Y),

    send(@d, display, new(@help1, bitmap("img/help.jpg")), point(H1X,H1Y)),
    send(@d, display, new(@help2, bitmap("img/help.jpg")), point(H2X,H2Y)),
    send(@d, display, new(@help3, bitmap("img/help.jpg")), point(H3X,H3Y)).

delete_help() :-
    help(1),
    retract(help(1)),
    assertz(help(0)),
    send(@help1, destroy),
    send(@help2, destroy),
    send(@help3, destroy);
    true.

change_diff(X) :- 
    send(@diff_l, destroy),
    atom_string(X,Xs),
    atom_concat("img/n_",Xs,Xs_1),
    atom_concat(Xs_1,".jpg",Fn),
    send(@d, display, new(@diff_l, bitmap(Fn)), point(405,75)),    

	retract(difficulty(_)), 
	assertz(difficulty(X)).

process(A) :- 
    assertz(res(1)),
    answer(A), !, send(@d, display, new(@res , bitmap("img/r_1.jpg")), point(335,145));
    send(@d, display, new(@res , bitmap("img/r_0.jpg")), point(335,145)).

delele_res() :- 
    res(1), retract(res(1)), send(@res, destroy);
    true.

change() :- 

    delete_help(),

    send(@f_1 , destroy), send(@f_2 , destroy),
    send(@f_3 , destroy), send(@f_4 , destroy),
    send(@f_5 , destroy), send(@f_6 , destroy),
    send(@f_7 , destroy), send(@f_8 , destroy),
    send(@f_9 , destroy), send(@f_10, destroy),
    send(@f_11, destroy), send(@f_12, destroy),
    send(@f_13, destroy), send(@f_14, destroy),

    send(@i_1 , destroy), send(@i_2 , destroy),
    send(@i_3 , destroy), send(@i_4 , destroy),
    send(@i_5 , destroy), send(@i_6 , destroy),
    send(@i_7 , destroy), send(@i_8 , destroy),
    send(@i_9 , destroy), send(@i_10, destroy),
    send(@i_11, destroy), send(@i_12, destroy),
    send(@i_13, destroy), send(@i_14, destroy),
    start().
