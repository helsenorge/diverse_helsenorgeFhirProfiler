CodeSystem: NoKodeverk9179
Id: no-kodeverk-9179.codesystem
Title: "9179 Lukkekode for planlagt helsehjelp"
Description: "Dette kodeverket inneholder koder for beskrivelse av hvor langt planleggingen av en episode helsehjelp har kommet og hvordan planlagte episoder lukkes."
* ^identifier.system = "urn:ietf:rfc:3986"
* ^identifier.value = "urn:oid:2.16.578.1.12.4.1.1.9179"
* ^url = "urn:oid:2.16.578.1.12.4.1.1.9179"
* ^version = "1.3.2"
* ^status = #active
* ^experimental = false
* ^date = "2022-03-17"
* ^jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* ^caseSensitive = true
* ^content = #complete
* ^count = 25

* #AA00 "Har fått eksakt tidspunkt for oppmøte"
  "Benyttes når Type oppmøtetidspunkt for planlagt episode som ikke er spesifisert (verdi 1) blir spesifisert (Type oppmøtetidspunkt for planlagt episode verdi 3)."

* #AA10 "Helsehjelpsepisode påbegynt"
  "Benyttes når pasienten mottas/skrives inn og episode påbegynnes."

* #AA97 "Lukking av feilregistrert episode"
  "Benyttes når planlagt episode oppstår som følge av en feilregistrering/inkurie, og deretter lukkes."

* #AA99 "Ukjent årsak til lukking"
  "Benyttes når årsaken til lukkingen er ukjent."

* #FA01 "Flyttet/utsatt, årsak hos tredjepart/samarbeidspart"
  "Gjelder fra 2024. Brukes når årsaken til flytting eller utsettelse ligger hos tredjepart/samarbeidspart som skal bidra i helsehjelpen."

* #FP01 "Flyttet/utsatt, pasienten har bestemt flytting av episode av velferdsgrunner"
  "Hvis pasient varsler for sent kodes en utsettelse under FP10. Kan også velges hvis episoden blir fremskyndet etter initiativ fra pasient."

* #FP02 "Flyttet/utsatt, medisinsk årsak hos pasient"
  "For eksempel sykdom eller oppståtte kontraindikasjoner hos pasient. Kan også velges hvis fremskynding av episode, f.eks. ved forverring av pasientens tilstand."

* #FP10 "Flyttet/utsatt, pasienten har ikke møtt opp og ikke gitt beskjed"
  "Jamfør Forskrift om utgifter til poliklinisk helsehjelp § 10, Merknad 2F og forskrift om dekning av utgifter hos lege kapittel II, Merknad B2 som beskriver krav til pasientbetaling ved fravær eller avbestilling som skjer senest 24 timer før avtalt tid."

* #FP11 "Pandemi – Utsatt fordi pasienten ikke kan møte pga. karantene/isolasjon"
  "Brukes når pasient utsetter time grunnet smitte (isolasjon), eller fordi hen er i karantene."

* #FP99 "Flyttet/utsatt, øvrig årsak hos pasient"
  "Velges når ingen andre årsaker med første tegn FP passer som årsak til utsettelsen. Inkluderer også vær- og naturforhold, force majeur og andre hendelser som skaper forsinkelse og ligger utenfor pasientens kontroll."

* #FS01 "Flyttet/utsatt, enhet har bestemt flytting av episoden på grunn av ressurssituasjonen"
  "Kan være både fremskynding og utsettelse. Eksempler på ressurs- eller kapasitetsmangel kan være helsepersonell, pasientrom eller sengeplass, medisinsk utstyr, operasjonsstue, postoperativ-/intensivkapasitet, eller annet."

* #FS10 "Pandemi – Institusjonen/sykehuset har utsatt avtale pga. pandemi"
  "Brukes når institusjonen/sykehuset har utsatt helsehjelp på grunn av pandemien. Kan skyldes endret tilgang på ressurs- eller helsepersonell (behandler syk eller i karantene). Kan også skyldes endret tilgang på pasientrom eller sengeplass, medisinsk utstyr, operasjonsstue, postoperativ-/intensivkapasitet, eller andre omlegginger grunnet pandemi. Brukes også når det foreligger lokal eller nasjonal restriksjon som gjør at institusjonen/sykehuset ikke kan gjennomføre avtalen."

* #FS20 "Flyttet/utsatt, oppstart av helsehjelp er endret grunnet kapasitetssituasjonen ved påfølgende enhet"
  "Benyttes når helsehjelpen forutsetter kapasitet til å gi pasienten helsehjelp også ved den neste institusjonen, f.eks. ved avrusning og påfølgende innleggelse annet sted."

* #FS99 "Flyttet/utsatt, annen årsak ved enhet"
  "Velges når ingen andre årsaker med første tegn FS passer som årsak til flyttingen/utsettelsen."

* #KA01 "Kansellert, årsak hos tredjepart/samarbeidspart"
  "Gjelder fra 2024. Brukes når årsaken til kansellering ligger hos tredjepart/samarbeidspart som skal bidra i helsehjelpen."

* #KP01 "Kansellert, pasienten ønsker ikke helsehjelp"

* #KP02 "Kansellert, pasienten er død"

* #KP20 "Kansellert, pasientansvar overført til annen enhet via fritt behandlingsvalg"
  "Benyttes når annen institusjon/lokalisering/sykehus overtar pasientansvaret i forbindelse med fritt behandlingsvalg."

* #KP21 "Kansellert, pasientansvar overført til annen enhet via raskere tilbake-ordningen"
  "Benyttes når annet institusjon/lokalisering/sykehus overtar pasientansvaret i forbindelse med raskere tilbake."

* #KP22 "Kansellert, pasienten mottar helsehjelp ved annen enhet rekvirert av Helfo"
  "For eksempel ved fristbrudd."

* #KP23 "Kansellert, pasienten skal motta helsehjelp i utlandet"
  "Kan velges både når annen helsehjelp er finansiert av Norge og privat helsehjelp hvis pasienten gir informasjon om det."

* #KP29 "Kansellert, pasientansvar overført til annen enhet, medisinsk årsak"
  "Benyttes når annen institusjon overtar pasientansvaret, f.eks. knyttet til funksjonsfordeling, varig kontraindikasjon mot planlagt helsehjelp, eller annet. Unntatt fritt behandlingsvalg, raskere tilbake, rekvirering av Helfo og helsehjelp i utlandet."

* #KP99 "Kansellert, annen årsak hos pasient"
  "Velges når ingen andre årsaker med første tegn KP passer som årsak til kanselleringen."

* #KS01 "Kansellert, pasientansvar overført til annen enhet, administrativ årsak"
  "Kan benyttes ved org.endringer eller avvikling, bortfall av anbudsavtale eller godkjenning, endring i funksjonsfordeling eller annen årsak uten at rapporteringsansvaret er avviklet. Institusjon svarer henviser og eventuelt pasient og fastlege."

* #KS99 "Kansellert, annen årsak ved enheten"
  "Velges når ingen andre årsaker med første tegn KS passer som årsak til utsettelsen."