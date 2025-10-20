% ---------- Folder facts ----------
folder(root1).
folder(root2).
folder(root3).
folder(root4).
folder(proj3_1).
folder(proj3_2).
folder(proj3_3).
folder(proj3_4).
folder(proj3_5).
folder(proj3_6).
folder(subpr3_2_1).
folder(subpr3_2_2).
folder(subpr3_2_3).
folder(subpr3_2_4).
folder(cat3_2_4_1).
folder(cat3_2_4_2).
folder(cat3_2_4_3).
folder(subcat3_2_4_2_1).
folder(subpr3_3_1).

file(presentation1, pptx, 133, date(25,10,2023)).
file(presentation2, pptx, 148, date(25,10,2023)).
file(lab1, pl, 1, date(1,11,2023)).
file(lab2, pl, 1, date(25,10,2023)).
file(lab3, pl, 1, date(16,11,2023)).
file(lab4, pl, 1, date(8,11,2021)).
file(notes1, docx, 757, date(25,10,2023)).
file(report1, pdf, 99, date(25,10,2023)).
file(notes2, docx, 77, date(25,10,2023)).
file(report2, pdf, 252, date(25,10,2023)).

% ---------- Containment facts ----------
contains(root3, proj3_1).
contains(root3, proj3_2).
contains(root3, proj3_3).
contains(root3, proj3_4).
contains(root3, proj3_5).
contains(root3, proj3_6).
contains(proj3_2, subpr3_2_1).
contains(proj3_2, subpr3_2_2).
contains(proj3_2, subpr3_2_3).
contains(proj3_2, subpr3_2_4).
contains(subpr3_2_4, cat3_2_4_1).
contains(subpr3_2_4, cat3_2_4_2).
contains(subpr3_2_4, cat3_2_4_3).
contains(cat3_2_4_2, subcat3_2_4_2_1).
contains(proj3_3, subpr3_3_1).

