import pandas as pd
import numpy as np
Jap_nominal_GDP = pd.read_csv(
    "C:/Users/ichir/Documents/seminar/final_paper_data/nominal_quater_gdp_Jap.csv")
Year = np.arange(1994, 2023)
Quater = ["Q1", "Q2", "Q3", "Q4"]
FT = []
for i in Year:
    for j in Quater:
        Q = str(i)+j
        FT.append(Q)
del FT[-2:]
Jap_nominal_GDP['FT'] = FT
Jap_nominal_GDP = Jap_nominal_GDP.set_index("FT")
Jap_CPI_2015 = pd.read_csv(
    "C:/Users/ichir/Documents/seminar/final_paper_data/CPI_CI-index_2015norm.csv")
CPI_MONTH = Jap_CPI_2015["CI_CPI(2015)"].tolist()
n = int(342/3)
CPI_2015 = []
for i in range(n):
    Q1 = [CPI_MONTH[3*i-2], CPI_MONTH[3*i-1], CPI_MONTH[3*i]]
    Q2 =  # 幾何平均をとる
