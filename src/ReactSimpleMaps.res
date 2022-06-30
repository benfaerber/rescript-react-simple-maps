type coords = (float, float)

type geographyPropertyData = {
  \"type": string,
  geounit: string
}

type geographyGeometryData = {
  \"type": string,
  coordinates: array<array<coords>>
}

type geographyData = {
  \"type": string,
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

type step = (float, float)

module ComposableMap = {
  @react.component @module("react-simple-maps")
  external make: (
    ~children: React.element,
    ~width: option<float> = ?,
    ~height: option<float> = ?,
    ~projection: option<'a> = ?,
    ~projectionConfig: option<'b> = ?
  ) => React.element = "ComposableMap"
}

module ZoomableGroup = {
  @react.component @module("react-simple-maps")
  external make: (
    ~children: React.element,
    ~center: option<coords> = ?,
    ~zoom: option<float> = ?,
    ~minZoom: option<float> = ?,
    ~maxZoom: option<float> = ?,
    ~translateExtent: option<(coords, coords)> = ?,
    ~onMove: option<movement => unit> = ?,
    ~onMoveStart: option<position => unit> = ?,
    ~onMoveEnd: option<position => unit> = ?
  ) => React.element = "ZoomableGroup"
}

module Sphere = {
  @react.component @module("react-simple-maps")
  external make: (
    ~id: option<string> = ?,
    ~fill: option<string> = ?,
    ~stroke: option<string> = ?,
    ~strokeWidth: option<float> = ?
  ) => React.element = "Sphere"
}

module Graticule = {
  @react.component @module("react-simple-maps")
  external make: (
    ~fill: option<string> = ?,
    ~stroke: option<string> = ?,
    ~step: option<step> = ?
  ) => React.element = "Graticule"
}

// Geographies is not supported.
// I can't find a way to support components returning children in rescript

module Geography = {
  @react.component @module("react-simple-maps")
  external make: (
    ~key: string,
    ~geography: geographyData,
    ~fill: option<string> = ?,
    ~stroke: option<string> = ?,
  ) => React.element = "Geography"
}

module Marker = {
  @react.component @module("react-simple-maps")
  external make: (
    ~children: React.element,
    ~coordinates: coords,
    ~style: option<'a> = ?
  ) => React.element = "Marker"
}

module Line = {
  @react.component @module("react-simple-maps")
  external make: (
    ~from: option<coords> = ?,
    ~\"to": option<coords> = ?,
    ~coordinates: option<array<coords>> = ?,
    ~stroke: option<string> = ?,
    ~strokeWidth: option<string> = ?,
    ~fill: option<string> = ?
  ) => React.element = "Line"
}

module Annotation = {
  @react.component @module("react-simple-maps")
  external make: (
    ~children: React.element,
    ~subject: coords = ?,
    ~dx: option<float> = ?,
    ~dy: option<float> = ?,
    ~curve: option<float> = ?,
    ~connectorProps: option<'a> = ?
  ) => React.element = "Annotation"
}

@module("./geographyTestData.js")
external geographyTestData: array<geographyData> = "default"