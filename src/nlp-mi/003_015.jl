function nlp_mi_003_015(optimizer, objective_tol, primal_tol, dual_tol)
    # Test Goals:
    # - quadratic objective as NLobjective and non-linear constraints
    
    m = Model(solver = optimizer)
    
    @variable(m, x, Int)
    @variable(m, y, Int)
    
    @NLobjective(m, Max, x^2 + y)
    @NLconstraint(m, y >= exp(x-2) - 2)
    @NLconstraint(m, y <= sin(x)^2 + 2)
    
    status = solve(m)
    
    check_status(status)
    check_objective(m, 11.000000198181866, tol = objective_tol)
    check_solution([x,y], [3, 2], tol = primal_tol)
    
end
