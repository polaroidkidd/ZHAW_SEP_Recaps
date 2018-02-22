function [x] = matrix_rel_err_condition(A, b_exact, b_faulty, normstr)
    if(strcmp(normstr, '1'))
        norm_choice = 1;
    elseif(strcmp(normstr, '2'))
        norm_choice = 2;
    elseif(strcmp(normstr, 'inf'))
        norm_choice = 'inf';
    else
        error('ERROR: matrix_CondA requiquires 1) n * n Matrix 2) norm being either "1", "2" or "inf" as String')
        
    end
    disp('Result in Decimal. For % * 100')
    x = norm(A, norm_choice) * norm(inv(A), norm_choice) * (norm(b_faulty - b_exact, norm_choice)/(norm(b_exact, norm_choice)));
    
end