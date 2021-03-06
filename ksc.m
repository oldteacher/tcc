pkg load statistics

casos = load("dados_hex/hex.cas");
popul = load("dados_hex/hex.pop");
geo = load("dados_hex/hex.geo");

casos_total = sum(casos);
pop_total = sum(popul);

mat_dist = squareform(pdist(geo));

[mat_dist,mat_indices] = sort(mat_dist);

function retval = llr_z
  for i = 1:length(mat_indices)
    zona = i
    n_z = popul(i)
    c_z = casos(i)
    mu_z = casos_total * (n_z / pop_total)
    if (c_z > mu_z)
      llr_z(i) = c_z * log(c_z / mu_z) + (casos_total - c_z) * log((casos_total - c_z) /
                                                               (casos_total - mu_z)),
    
    else
      llr_z(i) = 0
    endif
  endfor
  
endfunction
