/* A simple constraint satisfation problem

Smith, Baker, Carpenter and Tailor have each a different profession (smith, baker, carpenter, tailor) but not showed by their names, i.e. the Smith is not a smith, etc. Each of them has a son. But the sons do not have the profession showed by their name, either.
Find the professions of the parents and sons if: 
- No son has the same profession as his father has
- Baker has the same profession as Carpenter s son has
- Smith s son is a baker
*/

prof(baker).
prof(smith).
prof(carpenter).
prof(tailor).

profs(S, B, C, T, SonS, SonB, SonC, SonT) :-
  
    prof(S),
    prof(T),
    prof(B),
    prof(C), 	
    prof(SonS),
    prof(SonT),
    prof(SonC),
    prof(SonB),

    S\=smith,
    SonS\=smith,
    T\=tailor,
    SonT\=tailor,
    B\=baker,
    SonB\=baker,
    C\=carpenter,
    SonC\=carpenter,

    S\=B,
    S\=SonS, 
    S\=C,
    T\=SonT, 
    S\=T,
    C\=SonC, 
    T\=B,
    B\=SonB,
    T\=C,
    SonC\=SonS, 
    B\=C,
    SonC\=SonB, 
    S\=B,
    SonC\=SonT, 
    S\=B,
    SonS\=SonB,  
    SonS\=SonT,
    SonT\=SonB,

    B=SonC,		
    SonS=baker. 
