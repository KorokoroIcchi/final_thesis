using CSV;
using DataFrames;
using StatsPlots;
using StatsBase;
Jap_quater_gdp = CSV.read("C:/Users/ichir/Documents/seminar/final_paper_data/nominal_quater_gdp_Jap.csv", DataFrame);
Year = Vector(1994:2022);
Quater = ["Q1", "Q2", "Q3", "Q4"];
QuaterTime = [];
for i in Year
    for j in Quater
        StringQuaterTime = string(i) * j
        push!(QuaterTime, StringQuaterTime[3:end])
    end
end
pop!(QuaterTime);
pop!(QuaterTime);
Jap_quater_gdp.FT = QuaterTime;
x = Jap_quater_gdp.FT;
y = Jap_quater_gdp.GDP;
plot(x, y, label="Nominal Quater GDP")
CPI_Month = CSV.read("C:/Users/ichir/Documents/seminar/final_paper_data/CPI_CI-index_2015norm.csv", DataFrame);
CPI_Month_list = CPI_Month."CI_CPI(2015)";
Quater_CPI = [];
for i = 1:114
    CPI_Quater_list = [CPI_Month_list[3i-2], CPI_Month_list[3i-1], CPI_Month_list[3i]]
    push!(Quater_CPI, geomean(CPI_Quater_list))
end
CPI_Quater_df = DataFrame(
    FT=QuaterTime,
    CPI_Quater=Quater_CPI
);
println(CPI_Quater_df)
Jap_Quater_GDP = innerjoin(Jap_quater_gdp, CPI_Quater_df; on=:FT);
names(Jap_Quater_GDP)[6:10]