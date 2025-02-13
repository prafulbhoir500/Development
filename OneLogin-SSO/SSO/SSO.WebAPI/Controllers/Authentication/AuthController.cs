using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SSO.Application.DTOs.Authentication;
using SSO.Application.Interfaces;

namespace SSO.WebAPI.Controllers.Authentication
{
    public class AuthController : BaseController
    {
        private readonly IAuthService _authService;

        public AuthController(IAuthService authService)
        {
            _authService = authService;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequestDto request)
        {
            //var response = await _authService.LoginAsync(request);
            //return Ok(response);
            return Ok();
        }
    }
}
