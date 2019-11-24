/////////////////////////////////////////////////////
// VARIABLES
/////////////////////////////////////////////////////

const Discord = require("discord.js");
const client = new Discord.Client();
const configs = require("./configs.json");
const fivereborn = require('fivereborn-query');
client.config = configs;

/////////////////////////////////////////////////////
// START THE BOT
/////////////////////////////////////////////////////

client.login(configs.token)
  .then(
    () => {
      console.log("Bot startet!");
      console.log("Receiving information, please wait...");
    },
    () => {
      client.destroy();
      console.log("Bot destroyed!");
    });

/////////////////////////////////////////////////////
// FUNCTIONS
/////////////////////////////////////////////////////

function activity() {
  setTimeout(() => {
    fivereborn.query(configs.serverInfo[0], configs.serverInfo[1], (err, data) => {
      if (err) {
        console.log(err);
      } else {
        client.user.setActivity(" online " + data.clients + "/" + data.maxclients, { type: configs.activityType });
      }
    });
    activity();
  }, 10000);
}
activity();