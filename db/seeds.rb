# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.create!({
    name: "El rey Leon",
    description: "This is a Movie",
    url: "https://imagessl6.casadellibro.com/m/ig/6/2339256.jpg",
    days: {},
})

Movie.create!({
    name: "Rapido y Furioso",
    description: "This is a Movie",
    url: "https://is3-ssl.mzstatic.com/image/thumb/Video118/v4/2e/b3/32/2eb332f3-c65b-38aa-382f-be95702ad3d6/pr_source.lsr/268x0w.png",
    days: {},
})

Movie.create!({
      name: "Avengers",
      description: "This is a Movie",
      url: "https://http2.mlstatic.com/juego-de-sabanas-vengadores-cubrecama-advenger-D_NQ_NP_977852-MLA28412707163_102018-F.jpg",
      days: {},
  })





