class Museum {
  const Museum({
    required this.name,
    required this.description,
    required this.coordinates,
    required this.website,
    required this.imageAsset,
  });

  final String name;
  final String description;
  final String coordinates;
  final String website;
  final String imageAsset;
}

const museums = <Museum>[
  Museum(
    name: 'Museo de Arte del Río',
    description:
        'Colección de pintura y escultura moderna, con salas dedicadas al arte del siglo XX y a exposiciones temporales.',
    coordinates: '4.5981, -74.0760',
    website: 'https://museodelrio.example',
    imageAsset: 'assets/museums/rio.jpg',
  ),
  Museum(
    name: 'Museo de Historia Natural Andina',
    description:
        'Especímenes de fauna, flora y geología de la región andina, organizados para consulta del público y de investigadores.',
    coordinates: '6.2518, -75.5636',
    website: 'https://historinanatural.example',
    imageAsset: 'assets/museums/andina.jpg',
  ),
  Museum(
    name: 'Museo Arqueológico del Altiplano',
    description:
        'Piezas arqueológicas de cerámica, orfebrería y piedra, conservadas como patrimonio de las culturas del altiplano.',
    coordinates: '5.0703, -75.5138',
    website: 'https://arqueoaltiplano.example',
    imageAsset: 'assets/museums/altiplano.jpg',
  ),
  Museum(
    name: 'Casa Museo del Patrimonio Local',
    description:
        'Casa histórica con objetos de la vida cotidiana, documentos y fotografías de la comunidad.',
    coordinates: '3.4516, -76.5320',
    website: 'https://casamuseo.example',
    imageAsset: 'assets/museums/casa.jpg',
  ),
];
