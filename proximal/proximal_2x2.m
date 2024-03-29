function out = proximal_2x2(f, STEP = 0.1)
    % ===================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 f cu puncte intermediare echidistante.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) ?i (2, 2).
    % Parametrii:
    % - f = imaginea ce se va interpola;
    % - STEP = distan?a dintre dou? puncte succesive.
    % ===================================================================================

    % TODO: Defineste coordonatele x si y ale punctelor intermediare.
    xs = 1:STEP:2;
    ys = 1:STEP:2;
    % Se afl? num?rul de puncte.
    n = length(xs);
    % TODO: Cele 4 puncte incadratoare vor fi aceleasi pentru toate punctele din interior.
    x1 = 1;
    x2 = 2;
    y1 = 1;
    y2 = 2;
    % TODO: Initializeaza rezultatul cu o matrice nula n x n.
    out = zeros(n, n);

    % Se parcurge fiecare pixel din imaginea finala.
    for i = 1 : n
        for j = 1 : n
            % TODO: Afla cel mai apropiat pixel din imaginea initiala.
            xap = round(xs(i));
            yap = round(ys(j));
            % TODO: Calculeaza pixelul din imaginea finala.
            out(i, j) = f(xap, yap);
        endfor
    endfor
endfunction
