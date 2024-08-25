import {generate} from "@genkit-ai/ai";
import {configureGenkit} from "@genkit-ai/core";
import {firebaseAuth} from "@genkit-ai/firebase/auth";
import {onFlow} from "@genkit-ai/firebase/functions";
import {geminiPro} from "@genkit-ai/vertexai";
import * as z from "zod";
import {firebase} from "@genkit-ai/firebase";
import {vertexAI} from "@genkit-ai/vertexai";

configureGenkit({
  plugins: [
    firebase(),
    vertexAI({ location: 'us-central1' }),
  ],
  logLevel: "debug",
  enableTracingAndMetrics: true,
});

export const menuSuggestionFlow = onFlow(
  {
    name: "menuSuggestionFlow",
    inputSchema: z.string(),
    outputSchema: z.string(),
    authPolicy: firebaseAuth((user) => {
      if (!user.email_verified) {
        throw new Error("Verified email required to run flow");
      }
    }),
  },
  async (subject) => {
    const prompt =
      `Suggest an item for the menu of a ${subject} themed restaurant`;

    const llmResponse = await generate({
      model: geminiPro,
      prompt: prompt,
      config: {
        temperature: 1,
      },
    });

    return llmResponse.text();
  }
);

