using CSV
using DataFrames
nominal_gdp = CSV.read("C:/Users/ichir/Documents/seminar/final_paper_data/Jap_Nominal_GDP.csv", DataFrame)
eltype.(eachcol(nominal_gdp))
names(nominal_gdp)[1:5]
names(nominal_gdp)[6:10]
names(nominal_gdp)[11:15]
rename!(nominal_gdp, [:FY, :GDP_expenditure, :Cp, :Ih, :Ip, :Iz_p, :Cg, :Ig, :Iz_g, :E, :M, :PDFP, :GDFP, :GFCF, :FINSAL])
describe(nominal_gdp)