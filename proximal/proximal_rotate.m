function R = proximal_rotate(I, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul rotation_angle,
    % aplicand Interpolare Proximala.
    % rotation_angle este exprimat in radiani.
    % =========================================================================
    [m n nr_colors] = size(I);

    % Se converteste imaginea de intrare la alb-negru, daca este cazul.
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % in Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmultesc x si y cu s_x respectiv s_y,
    % atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul [0, n - 1].

    % TODO: Calculeaza cosinus si sinus de rotation_angle.
    c = cos(rotation_angle);
    s = sin(rotation_angle);
    % TODO: Initializeaza matricea finala.
    R = zeros(m, n);
    % TODO: Calculeaza matricea de transformare.
    T_rot = [c, -s; s, c];
    % TODO: Inverseaza matricea de transformare, FOLOSIND doar functii predefinite!
    T_rot_inv = inv(T_rot);
    % Se parcurge fiecare pixel din imagine.
    for y = 0 : m - 1
        for x = 0 : n - 1
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
            old_coords = T_rot_inv * [x; y];
            % TODO: Trece (xp, yp) din sistemul de coordonate [0, n - 1] in
            % sistemul de coordonate [1, n] pentru a aplica interpolarea.
            old_coords = old_coords + [1; 1];
            % TODO: Daca xp sau yp se afla in exteriorul imaginii,
            % se pune un pixel negru si se trece mai departe.
            if old_coords(1) < 1 || old_coords(1) > n
                R(y+1, x+1) = 0;
                continue;
            endif
            if old_coords(2) < 1 || old_coords(2) > m
                R(y+1, x+1) = 0;
                continue;
            endif
            % TODO: Afla punctele ce inconjoara(xp, yp).
            x1 = double(floor(old_coords(1)));
            x2 = double(ceil(old_coords(1)));
            y1 = double(floor(old_coords(2)));
            y2 = double(ceil(old_coords(2)));
            if y2 > m
                y2 = y1;
            endif
            if x2 > n
                x2 = x1;
            endif
            % TODO: Calculeaza coeficientii de interpolare notati cu a
            % Obs: Se poate folosi o functie auxiliara in care sau se calculeze coeficientii,
            % conform formulei.
            a = proximal_coef(I , x1, y1, x2, y2);
            % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
            R(y+1, x+1) = a(1) + a(2) * old_coords(1) + a(3) * old_coords(2) + a(4) * old_coords(1) * old_coords(2);
        endfor
    endfor

    % TODO: Transforma matricea rezultata in uint8 pentru a fi o imagine valida.
    R = uint8(R);
endfunction
