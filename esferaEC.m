function [CampoElect] = esferaEC(umbral, random, posXG, posYG)
hold on
radioGlobulo = 3;
radioCargas = 1;

[x, y, z] = sphere(10);

x = x * radioGlobulo;
y = y * radioGlobulo;
z = z * radioGlobulo;

posXCarga = random * (radioGlobulo - 2*radioCargas) + radioCargas;

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
    posXG = 24.5;
    posYG = (randi([0,15],1,1));
end

% Creacion de esfera y sus cargas

surf(x + posXG, y + posYG, z, 'FaceColor', 'r', 'EdgeColor', 'r', 'FaceAlpha', '0.2');

surf(xp - posXCarga + posXG, yp + posYG, zp, 'FaceColor', 'k', 'EdgeColor', 'k', 'FaceAlpha', '0.2');
surf(xp - -posXCarga + posXG, yn + posYG, zn, 'FaceColor', 'k', 'EdgeColor', 'k', 'FaceAlpha', '0.2');
end
