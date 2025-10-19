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
