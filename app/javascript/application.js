import embed from "vega-embed"

window.vegaEmbed = embed
window.dispatchEvent(new Event("vega:load"))