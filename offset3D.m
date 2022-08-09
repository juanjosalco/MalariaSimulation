function verticesR = offset3D(vecOrig, dx, dy, dz)

    n_fil = length(vecOrig);
    
    for i = 1:n_fil
        verticesR(i,1) = vecOrig(i,1) + dx;
    end

    for i = 1:n_fil
        verticesR(i,2) = vecOrig(i,2) + dy;
    end

    for i = 1:n_fil
        verticesR(i,3) = vecOrig(i,3) + dz;
    end

end