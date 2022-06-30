type coords = (float, float)

type geographyPropertyData = {
  _type: string,
  geounit: string
}

type geographyGeometryData = {
  _type: string,
  coordinates: array<array<coords>>
}

type geographyData = {
  _type: string,
  properties: geographyPropertyData,
  geometry: geographyGeometryData,
  rsmKey: string,
  svgPath: string
}

type movement = {
  x: float,
  y: float,
  z: float
}

type position = {
  coordinates: coords,
  zoom: float
}

module ComposableMap = {
  @react.component @module("react-simple-maps")
  external make: (~children: React.element) => React.element = "ComposableMap"
}

module Geography = {
  @react.component @module("react-simple-maps")
  external make: (
    ~key: string,
    ~geography: geographyData,
    ~fill: option<string>,
    ~stroke: option<string>,
  ) => React.element = "Geography"
}

module ZoomableGroup = {
  @react.component @module("react-simple-maps")
  external make: (
    ~children: React.element,
    ~center: coords,
    ~zoom: float,
    ~minZoom: float,
    ~maxZoom: float,
    ~translateExtent: option<(coords, coords)>,
    ~onMove: option<movement => unit>,
    ~onMoveStart: option<position => unit>,
    ~onMoveEnd: option<position => unit>
  ) => React.element = "ZoomableGroup"
}

@module("./geographyTestData.js")
external geographyTestData: array<geographyData> = "default"