function nlp_cvx_110_012(optimizer, objective_tol, primal_tol, dual_tol)
    m = Model(solver = optimizer)
    
    @variable(m, x)
    @variable(m, y)
    
    @NLobjective(m, Min, exp(x+y))
    @NLconstraint(m, x^2 + y^2 <= 1.0)
    
    status = solve(m)
    
    check_status(status)
    check_objective(m, exp(-2/sqrt(2)), tol = objective_tol)
    check_solution([x,y], [-1/sqrt(2), -1/sqrt(2)], tol = primal_tol)
    
end
