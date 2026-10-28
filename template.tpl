___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_axisolver",
  "version": 1,
  "securityGroups": [],
  "displayName": "AxiSolver",
  "brand": {
    "id": "ataraxis",
    "displayName": "Ataraxis"
  },
  "description": "Installe AxiSolver, l\u0027assistant IA qui résout les problèmes de vos visiteurs 24h/24. Entrez votre site_id et le widget apparaît sur toutes vos pages.",
  "categories": [
    "CHAT",
    "ANALYTICS"
  ],
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "siteId",
    "displayName": "Identifiant du site AxiSolver (site_id)",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      },
      {
        "type": "REGEX",
        "args": [
          "^[a-zA-Z0-9_-]{3,64}$"
        ],
        "errorMessage": "Le site_id doit contenir uniquement des lettres, chiffres, tirets ou underscores (3 à 64 caractères)."
      }
    ],
    "help": "Vous trouverez votre site_id dans votre dashboard AxiSolver sur https://axisolver.app/dashboard."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const encodeUriComponent = require('encodeUriComponent');

const siteId = data.siteId;

if (!siteId) {
  data.gtmOnFailure();
  return;
}

const url = 'https://axisolver.app/v1.js';

// L'injection de script via GTM ne permet pas directement d'ajouter des
// attributs data-*. On passe le site_id en query string ; le loader lit
// cette valeur en priorité si présente, puis fallback sur data-site-id.
const urlAvecSiteId = url + '?siteId=' + encodeUriComponent(siteId);

injectScript(urlAvecSiteId, data.gtmOnSuccess, data.gtmOnFailure, 'axisolver-loader');


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://axisolver.app/v1.js*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Template Google Tag Manager pour AxiSolver.

Soumission : https://gallery.tagmanager.google.com/#/gallery
- Repo GitHub public requis
- Review Google ~1-2 semaines
- Après validation : apparaît dans la Gallery, installable en 3 clics par n'importe quel utilisateur GTM



