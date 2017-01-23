module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 11,

    // font family with optional fallbacks
    fontFamily: 'Menlo, "DejaVu Sans Mono", "Lucida Console", monospace',

    // terminal cursor background color (hex)
    cursorColor: '#F81CE5',

    // color of the text
    foregroundColor: '#fff',

    // terminal background color
    backgroundColor: '#000',

    // border color (window, tabs)
    borderColor: 'red',

    // custom css to embed in the main window
    css: `
    .term_fit:not(.term_term) {
      opacity: 0.5;
    }

    .term_fit.term_active {
      opacity: 1;
      transition: opacity 0.12s ease-in-out;
      will-change: opacity;
    }
    `,

    // custom css to embed in the terminal window
    termCSS: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // some color overrides. see http://bit.ly/29k1iU2 for
    // the full list
    colors: [
      '#000000',
      '#ff0000',
      '#33ff00',
      '#ffff00',
      '#0066ff',
      '#cc00ff',
      '#00ffff',
      '#d0d0d0',
      '#808080',
      '#ff0000',
      '#33ff00',
      '#ffff00',
      '#0066ff',
      '#cc00ff',
      '#00ffff',
      '#ffffff'
    ],
    visor: {
      hotkey: 'F13'
    },

    // hyperCommandGifs: {
    //   disabledCommands: ['test']
    // }
  },

  plugins: [
    // nice color scheme
    'hyperterm-seti',
    'hyperterm-title',
    'hyper-tabs-enhanced',
    'hyperterm-visor',
    'hyperlinks',
    'hyperterm-clicky',
    'hyper-command-gifs',
    'hyper-fileio'
  ],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],
};
