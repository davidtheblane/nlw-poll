import { FastifyInstance } from "fastify";


export async function pollResults(app: FastifyInstance) {
  app.get('/polls/:pollId/results', { websocket: true }, (connection, request) => {
    // Inscrever apenas nas mensagens publicadas no canal com o ID da enquete

  })
}