using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using API_PickUp;

namespace API_PickUp.Controllers
{
    public class PickUpsController : ApiController
    {
        private BD_pickupEntities db = new BD_pickupEntities();

        // GET: api/PickUps
        public IQueryable<PickUp> GetPickUps()
        {
            return db.PickUps;
        }

        // GET: api/PickUps/5
        [ResponseType(typeof(PickUp))]
        public IHttpActionResult GetPickUp(int id)
        {
            PickUp pickUp = db.PickUps.Find(id);
            if (pickUp == null)
            {
                return NotFound();
            }

            return Ok(pickUp);
        }

        // PUT: api/PickUps/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutPickUp(int id, PickUp pickUp)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != pickUp.ID_PickUp)
            {
                return BadRequest();
            }

            db.Entry(pickUp).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PickUpExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/PickUps
        [ResponseType(typeof(PickUp))]
        public IHttpActionResult PostPickUp(PickUp pickUp)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.PickUps.Add(pickUp);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = pickUp.ID_PickUp }, pickUp);
        }

        // DELETE: api/PickUps/5
        [ResponseType(typeof(PickUp))]
        public IHttpActionResult DeletePickUp(int id)
        {
            PickUp pickUp = db.PickUps.Find(id);
            if (pickUp == null)
            {
                return NotFound();
            }

            db.PickUps.Remove(pickUp);
            db.SaveChanges();

            return Ok(pickUp);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PickUpExists(int id)
        {
            return db.PickUps.Count(e => e.ID_PickUp == id) > 0;
        }
    }
}