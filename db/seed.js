import db from "#db/client";

import { createTracks } from "#db/queries/tracks";
import { createPlaylists } from "#db/queries/playlists";
import { createPlaylistTracks } from "#db/queries/playlists_tracks";

await db.connect();
await seed();
await db.end();
console.log("🌱 Database seeded.");

async function seed() {
  for (let i = 1; i <= 20; i++) {
    await createPlaylists("Playlist " + i, "lorem ipsum playlist description");
    await createTracks("Track " + i, i * 50000);
  }
  for (let i = 1; i <= 15; i++) {
    const playlistId = 1 + Math.floor(i / 2);
    await createPlaylistTracks(playlistId, i);
  }
}
