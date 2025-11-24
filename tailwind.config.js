import flowbite from "flowbite/plugin"

export default {
  content: [
    "./resources/**/*.blade.php",
    "./resources/**/*.js",
    "./resources/**/*.vue",
    "./node_modules/flowbite/**/*.js",
    "./node_modules/preline/dist/*.js",
  ],
  theme: {
    extend: {
      fontFamily:{
        sans:['"Roboto Flex"', 'sans-serif'],
      }
    },
  },
  plugins: [
    preline,
     require('@tailwindcss/forms'),
    flowbite,
    
  ],
};