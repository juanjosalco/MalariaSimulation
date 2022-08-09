function [CampoElect] = esfera(umbral)
hold on

randomList(1) = 0;
posXG(1) = 0;
posYG(1) = 0;

globulos(1) = 0;
cargasP(1) = 0;
cargasN(1) = 0;

numero_globulos_infectados = 0;

for i = 1:5
    radioGlobulo = 3;
    radioCargas = 1;

    [x, y, z] = sphere(10);

    x = x * radioGlobulo;
    y = y * radioGlobulo;
    z = z * radioGlobulo;

    random = rand(1,1);
    posXCarga = random * (radioGlobulo - 2*radioCargas) + radioCargas;

    randomList(i) = random;

    posXG(i) = (randi([-20,20],1,1)); % Se genera un posicion random para el orgien del globulo
    posYG(i) = (randi([0,25],1,1));

    [xp, yp, zp] = sphere(10);  % Se genera el punto de las 
    [xn, yn, zn] = sphere(10);

    xp = xp * radioCargas; %    Se expande el radio de las carga positiva
    yp = yp * radioCargas;
    zp = zp * radioCargas;

    xn = xn * radioCargas; %    Se expande el radio de las carga negativa
    yn = yn * radioCargas;
    zn = zn * radioCargas;

    RxCp = posXCarga; %Es igual a la distanci adel origen del globulo hasta el origen de la carga
    RyCp = 0;
    RzCp = 0;

    % Obtencion de sus campos electricos

    QCp = 5;
    QCn = -5;

    % Carga positiva

    k = 8.99*10^9;

    R = sqrt(RxCp.^2 + RyCp.^2 + RzCp.^2).^2;

    Ex = k .* QCp .* RxCp ./ R;
    Ey = k .* QCp .* RyCp ./ R;
    Ez = k .* QCp .* RzCp ./ R;

    ECp = sqrt(Ex.^2 + Ey.^2 + Ez.^2);

    % Carga negativa

    RxCn = posXCarga;
    RyCn = 0;
    RzCn = 0;

    k = 8.99*10^9;

    R = sqrt(RxCn.^2 + RyCn.^2 + RzCn.^2).^2;

    Ex = k .* QCn .* RxCn ./ R;
    Ey = k .* QCn .* RyCn ./ R;
    Ez = k .* QCn .* RzCn ./ R;

    ECn = sqrt(Ex.^2 + Ey.^2 + Ez.^2);

    CampoElect = ECp + ECn;

    if CampoElect > umbral
        numero_globulos_infectados = numero_globulos_infectados + 1;
    end

    % Creacion de esfera y sus cargas
    globulos(i) = surf(x + posXG(i), y + posYG(i), z, 'FaceColor', 'r', 'EdgeColor', 'r', 'FaceAlpha', '0.2');

    cargasP(i) = surf(xp - posXCarga + posXG(i), yp + posYG(i), zp, 'FaceColor', 'k', 'EdgeColor', 'k', 'FaceAlpha', '0.2');
    cargasN(i) = surf(xp - -posXCarga + posXG(i), yn + posYG(i), zn, 'FaceColor', 'k', 'EdgeColor', 'k', 'FaceAlpha', '0.2');
end

pause(10)

for i = 1:5
    delete(globulos(i))
    delete(cargasP(i))
    delete(cargasN(i))
end

for i = 1:5
    esferaEC(umbral, randomList(i), posXG(i), posYG(i));
end

if  numero_globulos_infectados > 0

    fprintf("El numero de globulos infectados es: %1f\n", numero_globulos_infectados);

    if numero_globulos_infectados >= 3
        disp("El paciente esta infectado de malaria");
    else
        disp("El paciente no esta infectado de malaria");
    end
end
end