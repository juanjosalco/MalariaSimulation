function [CampoElect] = esferaManual(separacion)
hold on
    radioGlobulo = 3;
    radioCargas = 1;
    
    [x, y, z] = sphere(10);

    x = x * radioGlobulo;
    y = y * radioGlobulo;
    z = z * radioGlobulo;

    [xp, yp, zp] = sphere(10);
    [xn, yn, zn] = sphere(10);

    xp = xp * radioCargas;
    yp = yp * radioCargas;
    zp = zp * radioCargas;

    xn = xn * radioCargas;
    yn = yn * radioCargas;
    zn = zn * radioCargas;

    posXCarga = separacion * (radioGlobulo - 2*radioCargas) + radioCargas;

    % Obtencion de sus campos electricos
    
    QCp = 5;
    QCn = -5;

    % Carga positiva

    RxCp = posXCarga;
    RyCp = 0;
    RzCp = 0;

    k = 8.99*10^9;

    R = sqrt(RxCp.^2 + RyCp.^2 + RzCp.^2).^2;

    Ex = k .* QCp .* RxCp ./ R;
    Ey = k .* QCp .* RyCp ./ R;
    Ez = k .* QCp .* RzCp ./ R;
    
    ECp = sqrt(Ex.^2 + Ey.^2 + Ez.^2)

    % Carga negativa

    RxCn = posXCarga;
    RyCn = 0;
    RzCn = 0;

    k = 8.99*10^9;

    R = sqrt(RxCn.^2 + RyCn.^2 + RzCn.^2).^2;

    Ex = k .* QCn .* RxCn ./ R;
    Ey = k .* QCn .* RyCn ./ R;
    Ez = k .* QCn .* RzCn ./ R;
    
    ECn = sqrt(Ex.^2 + Ey.^2 + Ez.^2)

    CampoElect = ECp + ECn;
end