import pandas as pd
import numpy as np
data=[['Nam',10],['Huy',15],['An',14]]
df=pd.DataFrame(data,columns=['Name','Age'])
print(np.mean(df['Age']))