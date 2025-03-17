/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const { onRequest } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.checkNickname = functions.https.onCall(async (data, context) => {
    const nickname = data.nickname;

    const userSnapshot = await admin.firestore().collection('users').where('nickname', '==', nickname).get();

    if (!userSnapshot.empty) {
        return { exists: true }; // Il nickname è già presente
    } else {
        return { exists: false }; // Il nickname è disponibile
    }
});

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
