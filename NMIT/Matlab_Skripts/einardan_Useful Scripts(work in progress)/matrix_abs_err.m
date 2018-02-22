function [x] = matrix_abs_err(A, b_faulty, b_exact, normstr)
    if(strcmp(normstr, '1'))
        norm_choice = 1;
    elseif(strcmp(normstr, '2'))
        norm_choice = 2;
    elseif(strcmp(normstr, 'inf'))
        norm_choice = 'inf';
    else
        error('ERROR: matrix_CondA requiquires 1) n * n Matrix 2) norm being either "1", "2" or "inf" as String')
        
    end
    
    x = norm(inv(A), norm_choice) * norm(b_exact - b_faulty, norm_choice)
    

end