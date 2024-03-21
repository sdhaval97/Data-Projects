# Analysis of Criminal Activities in the City of Montreal

This project aims to analyze criminal activities in the city of Montreal using provided datasets containing information about criminal incidents and police precincts. The analysis covers various aspects such as prevalent crimes, time distribution of crimes, top police precincts with complaints, and mapping crime incidents.

## Importing Libraries and Loading Datasets

The analysis is performed using Python programming language with the following libraries:
- pandas: for data manipulation and analysis.
- geopandas: for reading and working with geojson file.
- matplotlib: for data visualization.
- folium: for creating interactive maps.

Two datasets are used:
1. `actes-criminels.csv`: Contains information about criminal acts recorded by the Service de police de la Ville de Montréal (SPVM).
2. `limitespdq.geojson`: Contains the area covered by each SPVM (police) precinct.

## Analysis

### Top 3 prevalent crimes committed in Montreal
The top 3 prevalent crimes in Montreal are identified and counted from the 'CATEGORIE' column in the crime dataset.

### Time distribution of crimes
The distribution of crimes by different parts of the day (day, evening, night) is analyzed using the 'QUART' column in the crime dataset.

### Top 5 Police precincts with the most police complaints
The top 5 police precincts with the most crime complaints are identified based on the number of occurrences in the 'PDQ' column.

### 3 Police precincts with the least crime complaints
The bottom 3 police precincts with the least crime complaints are identified based on the number of occurrences in the 'PDQ' column.

### Mapping crime incidents
Crime incidents are mapped using latitude and longitude coordinates from the crime dataset. A Folium map is created with markers representing each crime incident, and a MarkerCluster layer is added for better visualization.

### Neighborhood with the most murder cases
The neighborhood with the most murder cases is identified based on the 'Infractions entrainant la mort' category in the crime dataset.

## Additional Information

- The datasets used in this analysis are included in this repository.
- This analysis is for demonstration purposes and may require adjustments for specific use cases or real-world scenarios.

For more detailed information about the analysis process and code implementation, please refer to the Python script files provided in this repository.


