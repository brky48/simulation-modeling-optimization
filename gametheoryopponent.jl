using JuMP, HiGHS

m = Model(HiGHS.Optimizer)

@variable(m, g)
@variable(m, p[1:3] >= 0)

@objective(m, Min, g)

@constraint(m, sum(p) == 1)
# @constraint(m, p[1] +  p[2] + p[3] == 1)
@constraint(m, 8*p[1] + 2*p[2] + 5*p[3] <= g)
@constraint(m, 4*p[1] + 6*p[2] + 3*p[3] <= g)
@constraint(m, 4*p[1] + 7*p[2] + 9*p[3] <= g)

@constraint(m, p[1] <= 1)
@constraint(m, p[2] <= 1)
@constraint(m, p[3] <= 1)

optimize!(m)