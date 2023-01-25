using GLM;
using DataFrames;
using CSV;
using RDatasets;
using Plots;
using StatsBase;

df = CSV.read("C:/Users/ichir/Documents/seminar/final_thesis/outputs/log_data_2factors.csv", DataFrame)
rename!(df, [:ComName, :ComCode, :StockCOde, :FY, :FM, :K, :Y, :L]);
df_sub1 = df[(df[!, :FY].<1991), :];
glm(@formula(Y ~ K + L + 0), df_sub1, Normal(), IdentityLink())

df_sub2 = df[(df.FY.>1990).&(df.FY.<2010), :];
glm(@formula(Y ~ K + L + 0), df_sub2, Normal(), IdentityLink())

df_sub3 = df[(df.FY.>2011).&(df.FY.<2020), :];
glm(@formula(Y ~ K + L + 0), df_sub3, Normal(), IdentityLink())