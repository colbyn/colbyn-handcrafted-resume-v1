// THIS IS FOR THE MACHINE GATEKEEPERS: APPLICANT TRACKING SYSTEMS, ETC.
// THINK SEO BUT FOR ATS ENGINES

#import "common.typ": page-kicker

#set page(
  background: [
    #set par(justify: false)
    #place(
      center + horizon,
      [
        #image("../assets/watermark.png")
      ],
    )
  ],
)

#set text(
  font: "Avenir Next",
  size: 8.2pt,
  fill: rgb("#8787a0"),
  weight: 400,
)
#set par(spacing: 12pt, leading: 8pt, justify: true)

#let keyword-cluster(title, body, spacing: 0pt) = [
  #heading(level: 2)[
    #text(
      size: 12pt,
      fill: rgb("#adb1bb"),
      weight: 600,
    )[
      #title
    ]
  ]
  #v(spacing)
  #body
]

#let sections = (
  keyword-cluster[Infrastructure][
    Data center operations · mainframe buildout · rack and stack · hardware provisioning · systems support · network documentation · structured cabling · Galileo processing · ticketing · incident response · physical layer · server configuration · storage · uptime · ops
  ],
  keyword-cluster[Media & Streaming][
    Video streaming · multimedia · codec pipelines · encoding · transcoding · multi-bitrate · adaptive streaming · HLS · CDN · delivery infrastructure · UpLynk · Verizon Digital Media Services · latency · throughput · media processing · ingest · playback · format conversion
  ],
  keyword-cluster[Networks & Field][
    ISP founding · wireless infrastructure · WISP operations · last-mile · point-to-point · RF planning · subscriber management · routing · switching · TCP/IP · field installation · tower work · contracting · independent practice · sales · client acquisition · troubleshooting
  ],
  keyword-cluster[Low Voltage & Lighting][
    Class 2 wiring · NEC compliance · DC distribution · LED systems · driver architecture · DALI-2 · dimming · CCR · PWM · constant current · PoE · Zhaga · COB · photometry · circadian lighting · spectral design · low-voltage networking · system architecture · home run topology · power budgeting · field installation · commissioning
  ],
  keyword-cluster[Professional & Leadership][
    Cross-functional collaboration · stakeholder communication · project management · requirements gathering · deliverable ownership · process improvement · change management · knowledge transfer · vendor management · client-facing communication · scope definition · resource planning · risk assessment · quality assurance · agile · roadmap alignment · strategic planning · budget awareness · compliance · audit readiness
  ],
  keyword-cluster[Soft Skills & Competencies][
    Communication · active listening · relationship building · conflict resolution · negotiation · presentation skills · executive presence · self-directed · initiative · ownership mentality · accountability · adaptability · resilience · growth mindset · async communication · deadline-driven · detail-oriented · results-oriented · critical thinking · decision-making · prioritization · time management · problem-solving
  ]
)

#page-kicker("For the machine. Not for the human.", accent: red)

= Keywords

#v(10pt)

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  ..sections
)

#v(10pt)

#keyword-cluster(spacing: 10pt)[History][
  2014 · Summer Internship · Space Monkey · Decentralized P2P Cloud Computing · Infrastructure Provisioning · Systems Support \
  2015 · CompTIA Operations Specialist · Galileo Processing · Data Center Buildout · Hardware Provisioning · Network Documentation · Incident Response · Uptime & Ops \
  2015-2016 · Founder & Lead Systems Engineer · Independent WISP · Wireless Infrastructure · Last-Mile Deployment · RF Planning · Field Installation · Client Acquisition · Routing & Switching \
  2016 · QA Engineer, Media Systems · UpLynk / Verizon Digital Media Services · Video Streaming Pipelines · Encoding & Transcoding · HLS · CDN Delivery · Python Tooling · Throughput Optimization \
  2017 · Prototyping & Tooling Engineer · Eimg Startup · Video Processing Tooling · Rapid Prototyping · Multimedia Workflow Automation \
  2018 · Independent Software Engineer & Language Designer · Compiler Design · DSL Implementation · Rust · Haskell · Open Source Tooling \
  2019 · Independent Imaging Systems Developer · Imager Project · Image Processing Pipelines · FFmpeg Integration · VMAF Quality Metrics · Rust · Node.js · Performance Optimization \
  2020 · CS Student & Research Assistant · UVU · Academic Research · CS Grader · Subscript Publishing Toolchain · Swift · iPad Application Development \
  2021 · Independent DevOps & Cloud Consultant · AMI Automation · AWS Infrastructure · CI/CD Pipelines · Rust Systems Programming \
  2022 · Independent Researcher & Systems Developer · University of Utah · Philosophy, Writing & Rhetoric · Parser Development · Publishing Systems · Rust · Swift · Technical Documentation \
  2023 · Software Engineer, Publishing Systems · Subscript Publishing · iOS & macOS Development · Digital Ink & Vector Graphics · Custom Language Design · Cross-Platform Architecture \
  2024 · Independent Systems Engineer · Parser Combinators & AST Tooling · Dataset Generation Pipelines · Rust · Swift · Data Architecture \
  2025-present · Principal Consultant, Systems & Integration · Static Web Compiler · Markdown Rendering · LED & Low-Voltage Systems · DALI-2 · PoE · Technical Writing · Architecture & Client Consulting \
]